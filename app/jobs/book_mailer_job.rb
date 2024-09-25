class BookMailerJob < ApplicationJob
  queue_as :default

  def perform(book_id, user_ids)
    book = Book.find(book_id)
    user_ids.each do |user_id|
      user = User.find(user_id)
      BookMailer.new_book_email(book, user).deliver_later 
    end
  end
end
