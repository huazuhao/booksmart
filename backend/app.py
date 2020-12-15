from db import *
from flask import Flask
import json
from flask import request
import os
import users_dao

app = Flask(__name__)
db_filename = "textbook.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

def extract_token(request):
    auth_header = request.headers.get("Authorization")
    if auth_header is None:
        return False, json.dumps({"error": "Missing authorization header."})
    
    bearer_token = auth_header.replace("Bearer ", "").strip()
    if bearer_token is None or not bearer_token:
        return False, json.dumps({"error": "Invalid authorization header."})

    return True, bearer_token

def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code

def failure_response(message, code=404):
    return json.dumps({"success": False, "error": message}), code

######### BOOKS ##########
@app.route('/api/books/all/')
def get_books():
    data = []
    for b in Book.query.all():
        mydict = b.serialize()
        data.append(mydict)
    return success_response(data)

@app.route('/api/books/<int:id>/')
def get_book(id):
    c = Book.query.filter_by(id = id).first()
    if c is None:
        return failure_response('book not found')
    data = c.serialize()
    return success_response(data)

# @app.route('/api/books/sell/', methods=["POST"])
# def create_book():
#     '''
#     body:
#     [required]: title, price, sellerId
#     [optional]: image, author, courseName, isbn, edition, condition
#     '''
#     body = json.loads(request.data)
#     price = body.get('price')

#     # check necessary fields
#     if body.get('title') is None or price is None or not (isinstance(price, int) or \
#         isinstance(price, float)) or body.get('sellerId') is None:
#         return failure_response('title/price/sellerId is empty or malformed')

#     # check user exists
#     c = User.query.filter_by(id = body.get('sellerId')).first()
#     if c is None:
#         return failure_response('user not found')

#     # create new book
#     new_book = Book(image=body.get('image',''), title=body.get('title'),\
#         author=body.get('author',''), courseName=body.get('courseName',''),\
#             isbn=body.get('isbn',''), edition=body.get('edition',''), condition=body.get('condition',''),\
#                 price=str(round(price, 2)),sellerId=body.get('sellerId'))
#     db.session.add(new_book)
#     db.session.commit()
#     data = new_book.serialize()

#     return success_response(data, 201)

@app.route('/api/books/sell/', methods=["POST"])
def create_book():
    '''
    body:
    [required]: title, price, sellerId
    [optional]: image, author, courseName, isbn, edition, condition
    '''
    # was_successful, session_token = extract_token(request)

    # if not was_successful:
    #     return session_token

    # user = users_dao.get_user_by_update_token(session_token)
    # if not user or not user.verify_update_token(session_token):
    #     return failure_response('Invalid update token.')
    
    body = json.loads(request.data)
    price = body.get('price')

    # check necessary fields
    if body.get('title') is None or price is None or not (isinstance(price, int) or \
        isinstance(price, float)) or body.get('sellerId') is None:
        return failure_response('title/price/sellerId is empty or malformed')

    # check user exists
    c = User.query.filter_by(id = body.get('sellerId')).first()
    if c is None:
        return failure_response('user not found')

    # # check user is the one who logged in
    # if user != c:
    #     return failure_response('Id does not match token')

    # create new book
    new_book = Book(image='', title=body.get('title'),\
        author=body.get('author',''), courseName=body.get('courseName',''),\
            isbn=body.get('isbn',''), edition=body.get('edition',''), condition=body.get('condition',''),\
                price=str(round(price, 2)),sellerId=body.get('sellerId'))
    db.session.add(new_book)
    db.session.commit()

    # upload image
    imageData = body.get('image')
    bookId = new_book.id

    # if imageData is None:
    #     return failure_response('No base64 URL to be found.')

    if imageData != '' and imageData is not None:
        asset = Asset(imageData=imageData, bookId=bookId)
        db.session.add(asset)
        db.session.commit()

    data = new_book.serialize()

    return success_response(data, 201)


######### USERS ##########
@app.route('/api/users/<int:id>/')
def get_user(id):
    c = User.query.filter_by(id = id).first()
    if c is None:
        return failure_response('user not found')
    data = c.serialize()
    return success_response(data)

# @app.route('/api/users/', methods=["POST"])
# def create_user():
#     '''
#     body:
#     [required]: name, email
#     '''
#     body = json.loads(request.data)
#     if body.get('name') is None or body.get('email') is None:
#         return failure_response('name or email is empty')
#     new_user = User(name = body.get('name'), email = body.get('email'))
#     db.session.add(new_user)
#     db.session.commit()
#     data = new_user.serialize()
#     return success_response(data, 201)

@app.route("/api/register/", methods=["POST"])
def register_account():
    body = json.loads(request.data)
    email = body.get("email")
    password = body.get("password")
    name = body.get("name")

    if email is None or password is None or name is None:
        return json.dumps({"error": "Invalid email or password"})

    was_created, user = users_dao.create_user(email, password, name)

    if not was_created:
        return json.dumps({"error": "User already exists"})

    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
        })

@app.route("/api/login/", methods=["POST"])
def login():
    body = json.loads(request.data)
    email = body.get("email")
    password = body.get("password")

    if email is None or password is None:
        return json.dumps({"error": "Invalid email or password"})

    was_successful, user = users_dao.verify_credentials(email, password)

    if not was_successful:
        return json.dumps({"error": "Incorrect email or password."})

    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token,
        "id": user.id
        })

@app.route("/api/session/", methods=["POST"])
def update_session():
    was_successful, update_token = extract_token(request)

    if not was_successful:
        return update_token
        
    try:
        user = users_dao.renew_session(update_token)
    except Exception as e:
        return json.dumps({"error": f"Invalid update token: {str(e)}"})

    return json.dumps({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token,
        "id": user.id
        })

#@app.route('/api/users/<int:id>/cart/add/', methods=["POST"])
#def add_to_cart(id):
#    '''
#    body:
#    [required]: bookId
#    '''
#    # was_successful, session_token = extract_token(request)
#
#    # if not was_successful:
#    #     return session_token
#
#    # user = users_dao.get_user_by_update_token(session_token)
#    # if not user or not user.verify_update_token(session_token):
#    #     return json.dumps({"error": "Invalid session token."})
#
#    body = json.loads(request.data)
#    bookId = body.get('bookId')
#
#    if bookId is None:
#        return failure_response('bookId is empty')
#
#    # get book
#    book = Book.query.filter_by(id = bookId).first()
#    if book is None:
#        return failure_response('book not found')
#
#    # get user
#    c = User.query.filter_by(id = id).first()
#    if c is None:
#        return failure_response('user not found')
#
#    # # check user is the one who logged in
#    # if user != c:
#    #     return failure_response('Id does not match token')
#    user = c
#
#    # check user is not adding own book to cart
#    if user.is_selling(book):
#        return failure_response('Cannot add own book to cart.')
#
#    # add to cart
#    assoc = book_user_table.insert().values(book_id=bookId, user_id=id)
#    db.session.execute(assoc)
#    db.session.commit()
#
#    return success_response(book.serialize(), 201)
    
@app.route('/api/users/<int:id>/cart/add/', methods=["POST"])
def add_to_cart(id):
    '''
    body:
    [required]: bookId
    '''
    body = json.loads(request.data)
    bookId = body.get('bookId')

    if bookId is None:
        return failure_response('bookId is empty')

    # get book
    book = Book.query.filter_by(id = bookId).first()
    if book is None:
        return failure_response('book not found')
    
    # get user
    user = User.query.filter_by(id = id).first()
    if user is None:
        return failure_response('user not found')

    #TODO: not your own book

    # add to cart
    assoc = book_user_table.insert().values(book_id=bookId, user_id=id)
    db.session.execute(assoc)
    db.session.commit()

    return success_response(book.serialize(), 201)

@app.route('/api/users/<int:id>/cart/remove/', methods=['DELETE'])
def remove_from_cart(id):
    '''
    body:
    [required]: bookId
    '''
    # was_successful, session_token = extract_token(request)

    # if not was_successful:
    #     return session_token

    # user = users_dao.get_user_by_update_token(session_token)
    # if not user or not user.verify_update_token(session_token):
    #     return json.dumps({"error": "Invalid session token."})
    
    body = json.loads(request.data)
    bookId = body.get('bookId')

    if bookId is None:
        return failure_response('name or email is empty')

    # get book
    book = Book.query.filter_by(id = bookId).first()
    if book is None:
        return failure_response('book not found')
    
    # get user
    c = User.query.filter_by(id = id).first()
    if c is None:
        return failure_response('user not found')

    # # check user is the one who logged in
    # if user != c:
    #     return failure_response('Id does not match token')

    user = c

    # remove from cart
    if book in user.cart:
        user.cart.remove(book)
        db.session.commit()

    return success_response(book.serialize(), 201)


###### ASSET #######
# @app.route('/api/upload/', methods=['POST'])
# def upload():
#     body = json.loads(request.data)
#     imageData = body.get('imageData')
#     bookId = body.get('bookId')

#     # get book
#     book = Book.query.filter_by(id = bookId).first()
#     if book is None:
#         return failure_response('book not found (create the book first!)')

#     if imageData is None:
#         return failure_response('No base64 URL to be found.')

#     asset = Asset(imageData=imageData, bookId=bookId)
#     db.session.add(asset)
#     db.session.commit()
    
#     return success_response(asset.serialize(), 201)

if __name__ == "__main__":
    # port = int(os.environ.get("PORT", 5000))
    # app.run(host="0.0.0.0", port=port)
    app.run(host="0.0.0.0", port=5000, debug=True)
