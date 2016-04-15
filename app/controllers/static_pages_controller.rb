class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @book = Book.new
      @books = current_user.books
      # debugger
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
