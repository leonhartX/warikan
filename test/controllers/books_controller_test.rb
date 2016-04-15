require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = books(:one)
  end

  test "should get show" do
    get book_path @book
    assert_redirected_to new_user_session_path
  end

  test "should get edit" do
    get edit_book_path @book
    assert_redirected_to new_user_session_path
  end

  test "should get update" do
    patch book_path @book, params: {
      title: "hanami again"
    }
    assert_redirected_to new_user_session_path
  end

  test "should get destroy" do
    delete book_path @book
    assert_redirected_to new_user_session_path
  end

end
