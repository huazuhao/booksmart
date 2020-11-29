from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

association_table = db.Table("association", db.Model.metadata,
    db.Column("book_id", db.Integer, db.ForeignKey("book.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

def _get_date():
    return str(datetime.datetime.now())

class Book(db.Model):
  __tablename__ = 'book'
  id = db.Column(db.Integer, primary_key = True)
  image = db.Column(db.String, nullable = False) # placeholder
  title = db.Column(db.String, nullable = False)
  author = db.Column(db.String, nullable = False)
  courseName = db.Column(db.String, nullable = False)
  isbn = db.Column(db.String, nullable = False)
  edition = db.Column(db.String, nullable = False)
  price = db.Column(db.String, nullable = False)
  sellType = db.Column(db.String, nullable = False)
  available = db.Column(db.Boolean, nullable = False, unique=False, default=True)

  createdAt = db.Column(db.String, default=_get_date)
  updatedAt = db.Column(db.String, onupdate=_get_date)

  sellerId = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

  users = db.relationship('User', secondary=association_table, back_populates='cart')

  def __init__(self, **kwargs):
    self.image = kwargs.get('image')
    self.title = kwargs.get('title')
    self.author = kwargs.get('author')
    self.courseName = kwargs.get('courseName')
    self.isbn = kwargs.get('isbn')
    self.edition = kwargs.get('edition')
    self.price = kwargs.get('price')
    self.sellType = kwargs.get('sellType') # TODO: validate
    self.sellerId = kwargs.get('sellerId')

  def serialize(self):
    return {
      'id': self.id,
      'image': self.image,
      'title': self.title,
      'author':self.author,
      'courseName': self.courseName,
      'isbn': self.isbn,
      'edition': self.edition,
      'price': self.price,
      'sellType': self.sellType,
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
  cart = db.relationship('Book', secondary=association_table, back_populates='users')

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

