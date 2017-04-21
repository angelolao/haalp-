class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]
  skip_before_action :authenticate_user!

  def new
    @force_admin = params[:force_admin] == "true"
    super
  end

  def create
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :skype, :user_type, :email, :password) }
  end
end
