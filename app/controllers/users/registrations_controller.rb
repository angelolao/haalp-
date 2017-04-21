class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def new
    @force_admin = params[:force_admin] == "true"
    super
  end

  def create
    super
  end

  private

  def configure_permitted_parameters
    params[:user][:category_ids] = params[:user][:category_ids].join(",") if params[:user][:category_ids]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :skype, :user_type, :email, :password, :category_ids) }
  end
end
