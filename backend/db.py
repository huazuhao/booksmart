from flask_sqlalchemy import SQLAlchemy
import datetime
import base64
import boto3
from io import BytesIO
import datetime
from mimetypes import guess_extension, guess_type
from PIL import Image
import random
import re
import string
import os

db = SQLAlchemy()

EXTENSIONS = ['png','jpg','jpeg']
BASE_DIR = os.getcwd()
S3_BUCKET = "booksmart"
S3_BASE_URL = f"https://{S3_BUCKET}.s3-us-east-1.amazonaws.com"

book_user_table = db.Table("book_user_table", db.Model.metadata,
    db.Column("book_id", db.Integer, db.ForeignKey("book.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

def _get_date():
    return str(datetime.datetime.now())

class Book(db.Model):
  __tablename__ = 'book'
  id = db.Column(db.Integer, primary_key = True)
  image = db.relationship('Asset', cascade='delete')
  title = db.Column(db.String, nullable = False)
  author = db.Column(db.String, nullable = False)
  courseName = db.Column(db.String, nullable = False)
  isbn = db.Column(db.String, nullable = False)
  edition = db.Column(db.String, nullable = False)
  price = db.Column(db.String, nullable = False)
  # sellType = db.Column(db.String, nullable = False)
  available = db.Column(db.Boolean, nullable = False, unique=False, default=True)

  createdAt = db.Column(db.String, default=_get_date)
  updatedAt = db.Column(db.String, onupdate=_get_date)

  sellerId = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

  users = db.relationship('User', secondary=book_user_table, back_populates='cart')

  def __init__(self, **kwargs):
    self.title = kwargs.get('title')
    self.author = kwargs.get('author')
    self.courseName = kwargs.get('courseName')
    self.isbn = kwargs.get('isbn')
    self.edition = kwargs.get('edition')
    self.price = kwargs.get('price')
    # self.sellType = kwargs.get('sellType') # TODO: validate
    self.sellerId = kwargs.get('sellerId')

  def serialize(self):
    return {
      'id': self.id,
      'image': [i.serialize() for i in self.image],
      'title': self.title,
      'author':self.author,
      'courseName': self.courseName,
      'isbn': self.isbn,
      'edition': self.edition,
      'price': self.price,
      # 'sellType': self.sellType,
      'available': self.available,

      'createdAt': self.createdAt,
      'updatedAt': self.updatedAt,

      'sellerId': self.sellerId
    }
  
class User(db.Model):
  __tablename__ = 'user'
  id = db.Column(db.Integer, primary_key = True)
  email = db.Column(db.String, nullable = False)
  name = db.Column(db.String, nullable = False)
  selling = db.relationship('Book', cascade='delete')
  cart = db.relationship('Book', secondary=book_user_table, back_populates='users')

  def __init__(self, **kwargs):
    self.email = kwargs.get('email')
    self.name = kwargs.get('name')

  def serialize(self):
    return{
      'id': self.id,
      'email': self.email,
      'name': self.name,
      'selling': [b.serialize() for b in self.selling],
      'cart': [b.serialize() for b in self.cart]
    }

class Asset(db.Model):
  __tablename__ = 'asset'

  id = db.Column(db.Integer, primary_key=True)
  base_url = db.Column(db.String, nullable=True)
  salt = db.Column(db.String, nullable=True)
  extension = db.Column(db.String, nullable=True)
  width = db.Column(db.Integer, nullable=True)
  height = db.Column(db.Integer, nullable=True)
  # createdAt = db.Column(db.String, default=_get_date)
  createdAt = db.Column(db.DateTime, nullable=False)

  bookId = db.Column(db.Integer, db.ForeignKey('book.id'), nullable=False)

  def __init__(self, **kwargs):
    self.create(kwargs.get('imageData'))
    self.bookId = kwargs.get('bookId')

  def serialize(self):
    return{
      'bookId': self.bookId,
      'url': f'{self.base_url}/{self.salt}.{self.extension}',
      'createdAt': str(self.createdAt)
    }

  def create(self, imageData):
    try:
      #base64 string -> .png -> png
      ext = guess_extension(guess_type(imageData)[0])[1:]
      if ext not in EXTENSIONS:
        raise Exception(f'Extension {ext} not supported.')

      # generating random string for image name
      salt = "".join(random.SystemRandom().choice(
        string.ascii_uppercase + string.digits
        )
        for _ in range(16)
      )

      # remove header of base64 string and open image
      img_str = re.sub("^data:image/.+;base64,","",imageData)
      img_data = base64.b64decode(img_str)
      img = Image.open(BytesIO(img_data))

      self.base_url = S3_BASE_URL
      self.salt = salt
      self.extension = ext
      self.width = img.width
      self.height = img.height
      self.createdAt = datetime.datetime.now()

      img_filename = f'{salt}.{ext}'
      self.upload(img, img_filename)

    except Exception as e:
      print(f'Unable to create image due to {e}.')

  def upload(self, img, img_filename):
    try:
      # save image temporarily on server
      img_temploc = f'{BASE_DIR}/{img_filename}'
      img.save(img_temploc)

      # upload image to S3
      s3_client = boto3.client('s3')
      s3_client.upload_file(img_temploc, S3_BUCKET, img_filename)

      # make S3 img url public
      s3_resource = boto3.resource('s3')
      object_acl = s3_resource.ObjectAcl(S3_BUCKET, img_filename)
      object_acl.put(ACL="public-read")

      # remove from temporary location
      os.remove(img_temploc)


    except Exception as e:
      print(f'Unable to create image due to {e}.')

