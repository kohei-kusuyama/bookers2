class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index

  end
  
  def destroy
    
  end
end
