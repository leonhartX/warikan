class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = "Book Created!"
      redirect_to @book
    else
      render 'static_pages/home'
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :total, :member)
  end
end
