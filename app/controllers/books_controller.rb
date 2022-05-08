class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path(@book.id)
  end

  def index
    @book = Book.all
    @book = Book.new(book_params)
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new(book_params)

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
