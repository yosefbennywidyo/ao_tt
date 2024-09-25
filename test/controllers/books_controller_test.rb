require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_book = books(:first)
    @second_book = books(:second)
    @first_user = users(:one)
    @second_user = users(:two)
    @author = Author.first
    sign_in @first_user
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
    assert_difference -> { @author.books.count }, 1 do
      post books_url, params: { book: { author_id: @author.id, description: "Book description", title: "Book Title", year_of_publication: 2024 } }
    end

    assert_redirected_to books_url
  end

  test "shouldn't create book" do
    assert_difference -> { @author.books.count }, 0 do
      post books_url, params: { book: { author_id: @author.id, description: "", title: "Book Title", year_of_publication: 2024 } }
    end

    assert_response :unprocessable_entity
  end

  test "shouldn't create book and show error messages" do
    assert_difference -> { @author.books.count }, 0 do
      post books_url, params: { book: { author_id: @author.id, description: "", title: "Book Title", year_of_publication: 2024 } }
    end

    assert_response :unprocessable_entity
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

  test "shouldn't update book when book detail missing" do
    patch book_url(@first_book), params: { book: { author_id: @author.id, description: "", title: "Book Title Updated" } }
    assert_response :unprocessable_entity
  end

  test "shouldn't update book" do
    sign_out @first_user
    sign_in @second_user

    patch book_url(@first_book), params: { book: { author_id: @author.id, description: "Book description updated", title: "Book Title Updated" } }
    assert_redirected_to books_url
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@first_book)
    end

    assert_redirected_to books_url
  end

  test "shouldn't destroy book" do
    sign_out @first_user
    sign_in @second_user

    assert_difference("Book.count", 0) do
      delete book_url(@first_book)
    end

    assert_redirected_to books_url
  end
end
