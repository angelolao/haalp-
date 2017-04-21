class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
    Category.create(permit_parameters)
    redirect_to categories_path
  end

  private

  def permit_parameters
    params.require(:category).permit(
      :title,
      :description
    )
  end
end
