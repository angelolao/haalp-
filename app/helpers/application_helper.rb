module ApplicationHelper
  def get_params
    params[:search] || {}
  end

  def worker_price(task)
    no_hired = divident_price(task)
    commission = (task.price.to_f / no_hired) * Task::COMMISSION
    [(task.price.to_f / no_hired) - commission, commission]
  end

  def poster_price(task)
    display_price(task.price.to_f / divident_price(task))
  end

  def divident_price(task)
    no_hired = Offer.no_hired(task_id: task.id)
    if no_hired.zero?
      task.worker_number.zero? ? 1 : task.worker_number
    else
      no_hired
    end
  end

  def display_price(price)
    return "--" unless price
    "₱#{sprintf('%.2f', price)}"
  end
end
