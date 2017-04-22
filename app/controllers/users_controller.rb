class UsersController < ApplicationController
  before_action :admin_authenticate, only: :admin_index
  before_action :new_user_args, only: :new_user

  def index
    @tasks = Task.not_completed.search(params[:search] || {})
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def new_user
    render layout: "guest"
  end

  def create_user
    @user = User.new(create_user_args)
    if @user.save
      sign_in(:user, @user)
      redirect_to root_path, notice: "Successfully signed in!"
    else
      render :new_member, layout: "guest"
    end
  end

  def admin_index
  end

  def mock_payment
  end

  def accept_payment
    ActionController::Parameters.permit_all_parameters = true
    current_user.money += params[:user].require(:money).to_f
    if current_user.save(validate: false)
      flash[:notice] = "payment transferred"
    else
      flash[:error] = "something went wrong"
    end
    redirect_to edit_user_registration_path
  end

  private

  def admin_authenticate

  end

  def new_user_args
    args = session["facebook"]
    ActionController::Parameters.permit_all_parameters = true
    args = ActionController::Parameters.new(
      name: args["name"],
      email: args["email"],
      uid: args["uid"]
    )
    @user = User.new(args.permit(:email, :name, :uid))
  end

  def create_user_args
    params[:user].merge!(
      password: Devise.friendly_token[0, 12],
      provider: "facebook"
    )

    params.require(:user).permit(
      :email, :password,
      :name, :user_type,
      :uid, :provider, :skype
    )
  end
end
