class UsersController < ApplicationController

  def index
  end

  def new

  end

  def new_user
    binding.pry
    args = session["facebook"]
    @user = User.new(name: args["nickname"], email: args["email"])
    render layout: "guest"
  end

  def create
    binding.pry
  end
end
