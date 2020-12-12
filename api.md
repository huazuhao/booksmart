
# BookSmart API

**How to run locally?**

  

Open terminal under /backend.

  

If it's your first time:

1. run `virtualenv venv`.

2. then `pip install -r requirements.txt`.

  

Run `. venv/bin/activate` to activate virtual environment.

Start the server by `python3 app.py`.

  

All the endpoints are accessed through `localhost:5000` at the beginning.

  

Control+C to stop the server.

Deactivate the virtual environment by `deactivate`.

  

**Updated: 12.1.2020**

  

## /api/books/all/

Get all books.

 

**Request body:** /

**Sample response:**
`{"success": true, "data": [{"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn": "DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt": null, "sellerId": 1}]}`

  

## /api/books/\<int:id\>/

Get book by id. 
\<int:id\>: book id

**Request body:** /

**Sample response:**
`{"success": true, "data": {"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn":"DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt":
null, "sellerId": 1}}`

## /api/books/sell/

Sell a book.

**Request body:**
```
{

"title":"test2",

"price":20.9,

"sellerId":1,

"image":  "",

"author":"DG",

"courseName":"CS2112",

"isbn":"AA10984",

"edition":"9"

}
```

**Sample response:**
 ```
  {"success": true, "data": {"id": 2, "image": "", "title": "test2", "author": "DG", "courseName": "CS2112", "isbn":

"AA10984", "edition": "9", "price": "20.9", "available": true, "createdAt": "2020-12-01 00:12:43.374832", "updatedAt":

null, "sellerId": 1}}
  ```

## /api/dev/books/delete-all/

**[dev only]** Delete all books.


**Request body:** /

**Sample response:** /
  

## /api/users/\<int:id\>/

Get user by id.
\<int:id\>: user id

**Request body:** /

**Sample response:**
```
{"success": true, "data": {"id": 1, "email": "loop@loop.com", "name": "david gries", "selling": [{"id": 1, "image": "",

"title": "test", "author": "DG", "courseName": "CS2110", "isbn": "DS12838", "edition": "2", "price": "100.12",

"available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt": null, "sellerId": 1}, {"id": 2, "image": "",

"title": "test2", "author": "DG", "courseName": "CS2112", "isbn": "AA10984", "edition": "9", "price": "20.9",

"available": true, "createdAt": "2020-12-01 00:12:43.374832", "updatedAt": null, "sellerId": 1}], "cart": []}}
```
  

## /api/users/

Create a user.

**Request body:**
```
{

"name":"david gries",

"email":"loop@loop.com"

}
```

**Sample response:** TBD

## /api/users/\<int:id\>/cart/add/

Add a book to cart.
\<int:id\>: user id

**Request body:**
```
{

"bookId":1

}
```

**Sample response:**
  ```
  {"success": true, "data": {"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn":

"DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt":

null, "sellerId": 1}}
  ```

## /api/users/\<int:id\>/cart/remove/

Remove a book from cart
\<int:id\>: user id

**Request body:**
```
{

"bookId":1

}
```

**Sample response:**
  ```
  {"success": true, "data": {"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn":

"DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt":

null, "sellerId": 1}}
  ```
  

## /api/dev/users/delete-all/

**[dev only]** Delete all users.

**Request body:** /

**Sample response:** /


## /api/upload/

Upload image.

**Request body:**
```
{
    "imageData": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAACWCAYAAACoyxpVAAAMYmlDQ1BJQ0MgUHJvZmlsZQAASImVVwdYU8kWnltSSWiBUKSE3kSRGkBKCC2CgFRBVEISSCgxJgQVOyqr4NpFFMuKroq46OoKyFoQsbso9r5YUFHWxYINlTchAV195Xvn++bOnzNn........",
    "bookId": 2
}
```

**Sample response:** 
```
{"success": true, "data": {"bookId": 2, "url": "https://booksmart.s3-us-east-1.amazonaws.com/7QNRZAJA3RJTVD3L.png",
"createdAt": "2020-12-12 11:41:00.335923"}}
```
