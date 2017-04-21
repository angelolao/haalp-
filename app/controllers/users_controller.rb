class UsersController < ApplicationController
  before_action :admin_authenticate, only: [:admin_index]

  def index
  end

  def new
  end

  def create
  end

  def admin_index
  end

  private

  def admin_authenticate
  end
end
