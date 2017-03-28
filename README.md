# README

## TODO

### Authentication

- [x] Authentication with JWT
- [x] Item API
- [x] Category API

```
% curl -X "POST" "http://localhost:3000/user_token" -H "Content-Type: application/json" -d $'{"auth": {"email": "test@example.com", "password": "test123"}}'
{"jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9......"}
% curl -X "GET" "http://localhost:3000/items" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9......" -H "Content-Type: application/json"
{"data":[{"id":"1","type":"items","links":{"self":"http://localhost:3000/items/1"},"attributes":{"name":"first item"}}],"links":{"first":"http://localhost:3000/items?page%5Blimit%5D=10&page%5Boffset%5D=0","last":"http://localhost:3000/items?page%5Blimit%5D=10&page%5Boffset%5D=0"}}
% curl -X "GET" "http://localhost:3000/categories" -H "Authorization: Bearer eyJ0eXAiOiJKV1Qi..." -H "Content-Type: application/json"
{"data":[{"id":"1","type":"categories","links":{"self":"http://localhost:3000/categories/1"},"attributes":{"name":"FOO"}}],"links":{"first":"http://localhost:3000/categories?page%5Blimit%5D=10&page%5Boffset%5D=0","last":"http://localhost:3000/categories?page%5Blimit%5D=10&page%5Boffset%5D=0"}}
```
