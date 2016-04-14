class StaticPagesController < ApplicationController
  def home
    @book = Book.new if user_signed_in?
    # debugger
  end

  def help
  end

  def about
  end

  def contact
  end
end
