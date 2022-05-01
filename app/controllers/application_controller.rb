class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramerters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される

  protected

  def configure_permitted_paramerters
    devise_paramerter_sanitizer.permit(:sign_up, keys: [:name])
  # devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録の際に、nameのデータ操作を許可している
  end
end
