# README

## Requirements

- Ruby: 3.3.4
- Rails: 7.2.1
- PostgreSQL
- Redis server
- MailCatcher

## Start project

```bash
bundle # install gems
bin/dev # run projec
bin/rails test:all # run all test
```

you can access the project on: `localhost:3000`

## API request

```bash
curl http://localhost:3000/api/v1/books.json -H "Authorization: Bearer USER_API_TOKEN"
```

change USER_API_TOKEN with one of user api_token available on database
