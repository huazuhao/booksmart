from db import db, Book, User
from flask import Flask
import json
from flask import request
import os

app = Flask(__name__)
db_filename = "textbook.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code

def failure_response(message, code=404):
    return json.dumps({"success": False, "error": message}), code

######### BOOKS ##########
@app.route('/api/books/all')
def get_books():
    data = []
    for b in Book.query.all():
        mydict = b.serialize()
        data.append(mydict)
    return success_response(data)

@app.route('/api/books/', methods=["POST"])
def create_book():
    body = json.loads(request.data)

    # check necessary fields
    if body.get('title') is None or body.get('price') is None or not str(body.get('price')).isnumeric() or \
        body.get('sellerId') is None or body.get('sellType') is None:
        return failure_response('title/price/sellerId/sellType is empty or malformed')

    # check user exists
    c = User.query.filter_by(id = body.get('sellerId')).first()
    if c is None:
        return failure_response('user not found')

    # create new book
    new_book = Book(image=body.get('image',''), title=body.get('title'),\
        author=body.get('author',''), courseName=body.get('courseName',''),\
            isbn=body.get('isbn',''), edition=body.get('edition',''), price=str(body.get('price')),\
                sellType=body.get('sellType'), sellerId=body.get('sellerId'))
    db.session.add(new_book)
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

@app.route('/api/users/', methods=["POST"])
def create_user():
    body = json.loads(request.data)
    if body.get('name') is None or body.get('email') is None:
        return failure_response('name or email is empty')
    new_user = User(name = body.get('name'), email = body.get('email'))
    db.session.add(new_user)
    db.session.commit()
    data = new_user.serialize()
    return success_response(data, 201)

if __name__ == "__main__":
    # port = int(os.environ.get("PORT", 5000))
    # app.run(host="0.0.0.0", port=port)
    app.run(host="0.0.0.0", port=5000, debug=True)
