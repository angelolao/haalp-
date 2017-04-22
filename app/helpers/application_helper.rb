module ApplicationHelper
  def get_params
    params[:search] || {}
  end

  def worker_price(task)
    no_hired = Offer.no_hired(task_id: task.id)
    commission = (task.price.to_f / no_hired) * Task::COMMISSION
    [(task.price.to_f / no_hired) - commission, commission]
  end
end
