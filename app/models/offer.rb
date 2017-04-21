class Offer < ApplicationRecord
  belongs_to :user, foreign_key: :worker_user_id
  belongs_to :task

  scope :by_task_id, -> task_id {
    where(task_id: task_id) if task_id.present?
  }

  scope :recent_order, -> { order("offers.created_at DESC") }

  class << self
    def search(args)
      by_task_id(args[:task_id])
        .recent_order
    end
  end
end
