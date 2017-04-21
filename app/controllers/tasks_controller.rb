class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @tasks = Task.all
  end

  def new
  end

  def edit
  end

  def create
    redirect_to Task.create(permit_parameters)
  end

  def show
    @task = Task.find(params[:id])
  end

  def history
    @tasks = Task.by_user(current_user.id).completed
  end

  private

  def permit_parameters
    params.require(:task).permit(
      :user_id,
      :title,
      :description,
      :due_date,
      :location,
      :category_ids,
      :price,
      :worker_number
    )
  end
end
