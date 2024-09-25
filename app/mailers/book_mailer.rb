class BookMailer < ApplicationMailer
	helper BooksHelper
	include BooksHelper

	def new_book_email(book, user)
    @book = book
    @user = user
    mail(to: @user.email, subject: 'New Book Available!')
  end
end
