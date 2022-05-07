class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録の際に、nameのデータ操作を許可している
  end
end
