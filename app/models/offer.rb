class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :by_task_id, -> task_id {
    where(task_id: task_id) if task_id.present?
  }

  scope :by_user_id, -> user_id {
    where(user_id: user_id) if user_id.present?
  }

  scope :by_make_offer, -> make_offer {
    where(make_offer: make_offer) if make_offer.present?
  }

  scope :by_status, -> status {
    where(status: status) if status.present?
  }

  scope :recent_order, -> { order("offers.created_at DESC") }

  class << self
    def search(args)
      by_task_id(args[:task_id])
        .by_user_id(args[:user_id])
        .by_make_offer(args[:make_offer])
        .by_status(args[:status])
        .recent_order
    end

    def accepted_offer?(args)
      search(args.merge(status: "accepted")).present?
    end

    def no_hired(args)
      search(args.merge(status: "accepted")).count
    end

    def offer(args)
      search(args).first
    end
  end
end
