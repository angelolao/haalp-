class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    elsif @user.new_record?
      session['facebook'] = @user.attributes.merge(image: request.env["omniauth.auth"]["info"]["image"])
      redirect_to new_user_users_path
    else
      redirect_to new_user_registration_path
    end
  end
end
