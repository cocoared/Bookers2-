class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @user =current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to request.referer
    flash[:notice] = "ユーザー情報を編集しました。"
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
