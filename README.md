# README

## Project Description
This Ruby on Rails project is a book management application that allows users to:
- View a list of books
- Create new books (with author selection from the database)
- Send email notifications upon new book creation
- Authenticate users using Devise
- Paginate the book list for improved performance
- Access an API endpoint to retrieve the book list in JSON format


## Key Features
- Models: User, Author, and Book with validations and relationships.
- Controllers & Views: Handles the display of the book list and the new book creation form.
- Background Jobs: Utilizes Sidekiq to send email notifications.
- Testing: test coverage is 97% (includes unit tests for the Book model).
- Authentication: Implements Devise and customize it to work with API for securing the application.
- Pagination: Enhances performance when displaying large book lists.
- API: Provides an endpoint to fetch the book list in JSON format.

## Requirements
- Ruby: 3.3.4
- Rails: 7.2.1
- PostgreSQL
- Redis server
- MailCatcher

all requirements should be installed

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
