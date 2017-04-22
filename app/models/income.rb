class Income < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :by_user_id, -> user_id {
    where(user_id: user_id) if user_id.present?
  }

  scope :by_task_id, -> task_id {
    where(task_id: task_id) if task_id.present?
  }

  scope :by_owned, -> owned {
    where(owned: owned) if owned.present?
  }

  class << self
    def worker_income(args)
      _income = by_user_id(args[:user_id])
        .by_task_id(args[:task_id])
        .by_owned("worker")
        .first

      _income.blank? ? "0.00" : _income.income
    end

    def my_income(user_id, owned)
      if owned == "company"
        by_owned(owned).pluck(:income).sum
      else
        by_user_id(user_id)
          .by_owned(owned)
          .pluck(:income)
          .sum
      end
    end
  end
end
