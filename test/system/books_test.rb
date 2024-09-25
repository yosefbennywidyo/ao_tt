require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @first_user = users(:one)
    @second_user = users(:two)
    @first_book = books(:first)
    @second_book = books(:second)
    sign_in @first_user
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_selector "button[type='submit']", text: "Create"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    fill_in "Title", with: @first_book.title
    fill_in "Description", with: @first_book.description
    select "Year of publication", "2024"
    select "Author", "2024"
    click_on "Create Book"

    assert_text "Book was successfully created"
    assert_redirected_to books_url
  end

  test "should update Book" do
    visit edit_book_url(@first_book.id)

    fill_in "book_author_id", with: @first_book.author_id
    fill_in "Description", with: @first_book.description
    fill_in "Title", with: @first_book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
    assert_redirected_to books_url
  end

  test "shouldn't update Book" do
    visit edit_book_url(@first_book.id)

    fill_in "book_author_id", with: @first_book.author_id
    fill_in "Description", with: ""
    fill_in "Title", with: @first_book.title
    click_on "Update Book"

    assert_text "Description can't be blank"
    assert_response :unprocessable_entity
  end

  test "should destroy Book" do
    visit book_url(@first_book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
