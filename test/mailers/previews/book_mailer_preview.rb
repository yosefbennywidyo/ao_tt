# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview
  setup do
    @user = users(:one)
    @author = Author.first
  end

  test "renders the new book email preview" do
    book = Book.new(title: "Sample Book", description: "A great new book", year_of_publication: 2023, author_id: @author.id)


    email_preview = BookMailerPreview.new_book_email(book, @user)

    assert_match "New Book Available!", email_preview.subject
    assert_match "Hi John Doe,", email_preview.body.to_s
    assert_match "Sample Book", email_preview.body.to_s
    assert_match "A great new book", email_preview.body.to_s
  end
end
