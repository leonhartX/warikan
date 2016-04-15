class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :show]
  before_action :correct_user, only: [:destroy]

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = "Book Created!"
    end
    redirect_to :back
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @book.destroy
    flash[:success] = "Book deleted"
    redirect_to request.referrer || root_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :total, :member)
  end

  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    redirect_to root_path if @book.nil?
  end
end
