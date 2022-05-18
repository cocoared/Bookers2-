class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = '書籍を投稿しました'
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    # @books = Book.all
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render edit
    else
      redirect_to books_path
      flash[:alert] = "書籍の投稿者以外は書籍編集画面へアクセスできません。"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = '書籍情報を編集しました。'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id), notice: "書籍を削除しました"
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
