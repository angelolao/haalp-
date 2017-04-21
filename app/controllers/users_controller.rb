class UsersController < ApplicationController

  def index
    @tasks = Task.search(params[:search] || {})
  end

  def new
  end

  def create
  end

end
