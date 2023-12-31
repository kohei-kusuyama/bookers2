class BooksController < ApplicationController
  def new

    @book_opinion = Book.new
  end

  def create
    @user = User.new
    @book_opinion = Book.new(book_params)
    @book_opinion.user_id = current_user.id
    if @book_opinion.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_opinion)
    else
      @books = Book.all
      @user.id = @book_opinion.user_id
      render :index
    end
  end
  def update
    @book_opinion = Book.find(params[:id])
    if @book_opinion.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book_opinion)
    else
      render :edit
    end
  end

  def edit
    @book_opinion = Book.find(params[:id])
    @user = @book_opinion.user
    if @user != current_user
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_opinion = Book.new
    @user = @book.user
  end

  def destroy
    @book_opinion =Book.find(params[:id])
    @book_opinion.destroy
    redirect_to books_path
  end
  def index
    @book_opinion = Book.new
    @books = Book.all
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end