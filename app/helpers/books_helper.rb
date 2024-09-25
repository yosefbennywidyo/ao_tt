module BooksHelper
  def edit_or_show_button(book)
    current_book_author(book) ? render_edit_button(book) : render_show_button(book)
  end

  def show_delete_button?(book)
    render_delete_button(book) if current_book_author(book)
  end

  def show_edit_button?(book)
    render_edit_button(book) if current_book_author(book)
  end

  private

  def current_book_author(book)
    current_user.id == book.author_id
  end

  def render_edit_button(book)
    link_to "Edit", edit_book_path(book), class: "m-2 rounded-sm py-1 px-6 bg-green-100 inline-block font-medium"
  end

  def render_show_button(book)
    link_to "Show", book_path(book), class: "m-2 rounded-sm py-1 px-6 bg-green-100 inline-block font-medium"
  end

  def render_delete_button(book)
    button_to "Destroy this book", @book, method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-red-100 font-medium"
  end

  def render_book_url(book)
    link_to "#{book.title}", book_url(book), class: "m-2 rounded-sm py-1 px-6 bg-green-100 inline-block font-medium"
  end
end
