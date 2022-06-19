class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range] #検索モデルの情報を受け取る

    if @range == "User"
      @users = User.looks(params[:search], params[:word]) #検索方法,検索ワードの情報を受け取る
      #looksメソッドを使い、検索内容を取得して変数に代入する
      #検索方法params[:search]と、検索ワードparams[:word]を参照してデータを検索し、
      #1：インスタンス変数@usersにUserモデル内での検索結果を代入します。
    else
      @books = Book.looks(params[:search], params[:word])
      #2：インスタンス変数@booksにBookモデル内での検索結果を代入します。
    end
  end
end
