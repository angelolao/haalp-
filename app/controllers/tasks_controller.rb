class TasksController < ApplicationController
  load_and_authorize_resource except: [:create]

  before_action :add_task, only: [:show, :update, :destroy]
  before_action :stringify_categories, only: [:create, :update]

  def index
    @tasks = Task.all
  end

  def new
  end

  def edit
  end

  def update
    @task.update_attributes(permit_parameters)
    redirect_to @task
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

  def add_task
    @task = Task.find(params[:id])
  end

  def stringify_categories
    params[:task][:category_ids] = params[:task][:category_ids].join(",") if params[:task][:category_ids]
  end
end
