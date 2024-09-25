require "test_helper"

class BookMailerTest < ActionMailer::TestCase
  setup do
    @first_book = books(:first)
    @second_book = books(:second)
    @first_user = users(:one)
    @second_user = users(:two)
    @author = Author.first
    sign_in @first_user
  end

  test "should send new book email when creating a book" do
    assert_difference "Sidekiq::Worker.jobs.size", 1 do
      perform_enqueued_jobs do
        Book.create!(author: @author, description: "Book description", title: "Book Title", year_of_publication: 2024)
      end
    end
  end
end
