require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_book = books(:first)
    @second_book = books(:second)
    @author = users(:one)
    sign_in @author
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author_id: @author.id, description: "Book description", title: "Book Title" } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@first_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@first_book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@first_book), params: { book: { author_id: @author.id, description: "Book description updated", title: "Book Title Updated" } }
    assert_redirected_to book_url(@first_book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@first_book)
    end

    assert_redirected_to books_url
  end
end
