class InvolvementsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    user = User.find_by(name: params[:involvement][:user])
    @book = Book.find_by(id: params[:book_id])
    if user && @book.user_id == current_user.id
      @book.involve user
      flash[:success] = "#{user.name} added to this book!"
    else
      flash[:danger] = "User not exsited!"
    end
    redirect_to @book
  end

  def destroy
    involvement = Involvement.find(params[:id])
    user = involvement.user
    @book = involvement.book
    if @book.user_id == current_user.id
      @book.devolve user
      flash[:success] = "#{user.name} removed from this book!"
    end
    redirect_to @book
  end

end
