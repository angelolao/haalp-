class CategoriesController < ApplicationController
  before_action :add_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def update
    @category.update_attributes(permit_parameters)
    redirect_to @category
  end

  def create
    Category.create(permit_parameters)
    redirect_to categories_path
  end

  private

  def permit_parameters
    params.require(:category).permit(:title, :description)
  end

  def add_category
    @category = Category.find(params[:id])
  end
end
