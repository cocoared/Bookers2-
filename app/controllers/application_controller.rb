class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top] #追記することで、ログインしていない場合はログイン画面に遷移する。
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseコントローラが動いたら、configure_permitted_parametersを処理する。
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される

 private

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  # devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録の際に、nameのデータ操作を許可している
  end
end
