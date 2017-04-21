class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]
  skip_before_action :authenticate_user!
  render layout: false

  def new
    render layout: false
    @force_admin = params[:force_admin] == "true"
    super
  end

  def create
    render layout: false
    super
  end

  private

  def configure_permitted_parameters
    render layout: false
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :skype, :user_type, :email, :password) }
  end
end
