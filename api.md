
  

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

  

  

**Updated: 12.15.2020**

  

  

## /api/books/all/

 **[GET]**

Get all books.



  

**Request body:** /

  

**Sample response:**

`{"success": true, "data": [{"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn": "DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt": null, "sellerId": 1}]}`

  

  

## /api/books/\<int:id\>/

  
**[GET]**
Get book by id.

\<int:id\>: book id

  

**Request body:** /

  

**Sample response:**

`{"success": true, "data": {"id": 1, "image": "", "title": "test", "author": "DG", "courseName": "CS2110", "isbn":"DS12838", "edition": "2", "price": "100.12", "available": true, "createdAt": "2020-11-30 22:57:21.163812", "updatedAt":

null, "sellerId": 1}}`

  

## /api/books/sell/

  
**[POST]**
Sell a book.

  

**Request body:**

```

{

"title":  "5th loopy question",

"sellerId":  1,

"price":  999.0,

"author":  "David Gries",

"image":  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANgAAADoCAYAAACNWipAAAAMYmlDQ1BJQ0MgUHJvZmlsZQAASImVVwdYU8kWnltSS.....",

"edition":  "2",

"courseName":  "CS2110",

"isbn":  "LOOPY564739"

}

```

  

**Sample response:**

```

{"success": true, "data": {"id": 2, "image": "", "title": "test2", "author": "DG", "courseName": "CS2112", "isbn":

  

"AA10984", "edition": "9", "condition":"okay", "price": "20.9", "available": true, "createdAt": "2020-12-01 00:12:43.

  

374832", "updatedAt": null, "sellerId": 1}}

```

  



## /api/users/\<int:id\>/

  
**[GET]**

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

  **[POST]**

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

  **[POST]**

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

  **[DELETE]**

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

## /api/register/

  **[POST]**

Register a user.


  

**Request body:**

```

{

"email":  "asd@gmail.com",

"password":"asdfghjk",

"name":"asd"

}

```

  

**Sample response:**

```

{"session_token": "bcdf349cd2029886e74bad2011c82d0009d7256d", "session_expiration": "2020-12-16 10:46:58.894067",

"update_token": "87b5b6e344911561a34fd1ccdf73b8f730ee01e8"}

```




  