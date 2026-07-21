+++
title = "Flask-RESTX REST API"
date = 2022-04-10T08:55:00Z
updated = 2026-07-21T06:47:00Z
categories = ["SERVER", "BACK-END"]
tags = ["PYTHON", "WEB"]
toc = true

[extra]
source = "notion"
notion_id = "f437efde-a460-4738-9908-ae4d5d480245"
notion_url = "https://app.notion.com/p/Flask-RESTX-REST-API-f437efdea46047389908ae4d5d480245"
external_url = "https://justkode.kr/python/flask-restapi-1"
+++

## 설치

```bash
pip install flask flask-restx
```

## 최소 예제

```python
from flask import Flask
from flask_restx import Api, Resource

app = Flask(__name__)
api = Api(app)

@api.route('/hello')
class HelloWorld(Resource):
    def get(self):
        return {"hello": "world!"}

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)
```

```bash
python app.py
# GET http://localhost/hello
```

## URL 패턴

```python
@api.route('/hello/<string:name>')
class Hello(Resource):
    def get(self, name):
        return {"message": "Welcome, %s!" % name}
```

## CRUD (todos)

`get`/`post`/`put`/`delete` 오버라이드. body는 `request.json`.

```python
from flask import Flask, request
from flask_restx import Resource, Api

app = Flask(__name__)
api = Api(app)
todos = {}
count = 1

@api.route('/todos')
class TodoPost(Resource):
    def post(self):
        global count, todos
        idx = count
        count += 1
        todos[idx] = request.json.get('data')
        return {'todo_id': idx, 'data': todos[idx]}

@api.route('/todos/<int:todo_id>')
class TodoSimple(Resource):
    def get(self, todo_id):
        return {'todo_id': todo_id, 'data': todos[todo_id]}
    def put(self, todo_id):
        todos[todo_id] = request.json.get('data')
        return {'todo_id': todo_id, 'data': todos[todo_id]}
    def delete(self, todo_id):
        del todos[todo_id]
        return {"delete": "success"}
```
