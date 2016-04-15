require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
  end

  test "valid book" do
  	assert @book.valid?
  end

  test "book should have title" do
    book = Book.new
    assert_not book.valid?
  end

  test "book total default to 0" do
    book = Book.new
    assert_equal book.total, 0
  end

  test "book member default to 1" do
    book = Book.new
    assert_equal book.member, 1
  end

  test "book title only with words" do
    @book.title = "new travle book"
    assert @book.valid?
  end

  test "book title should not has special char" do
    @book.title = "not Valid! book"
    assert_not @book.valid?
  end

  test "book total should greater than 0" do
    @book.total = -1
    assert_not @book.valid?
  end

  test "book member should greater than 1" do
    @book.member = 0
    assert_not @book.valid?
  end
end
