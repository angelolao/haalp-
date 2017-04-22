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
    params[:task][:due_date] = DateTime.current + 7.days
    redirect_to Task.create(permit_parameters)
  end

  def show
    @task = Task.find(params[:id])
    @offers = Offer.search(task_id: @task.id)
  end

  def history
    @tasks = Task.by_user(current_user.id).completed
  end

  def close_hiring
    task = Task.find(params[:id])
    task.status = "assigned"
    if task.save
      flash[:notice] = "Task hiring closed"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to task
  end

  def complete_task
    task = Task.find(params[:id])
    task.status = "completed"
    if task.save
      amend_income
      flash[:notice] = "Task completed!"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to task
  end

  private

  def amend_income
    workers = Offer.search(
      task_id: params[:id],
      status: "accepted"
    )
    task = Task.find(params[:id])
    workers.each do |worker|
      commission = (task.price / Offer.no_hired(task_id: task.id)) * Task::COMMISSION
      create_income(worker, (task.price / Offer.no_hired(task_id: task.id)) - commission, "worker")
      create_income(worker, commission, "company")
    end
  end

  def create_income(worker, income, owned)
    Income.create(
      user_id: worker.user_id,
      poster_id: current_user.id,
      task_id: params[:id],
      income: income,
      owned: owned
    )
  end

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
