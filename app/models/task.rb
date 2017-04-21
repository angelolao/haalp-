class Task < ApplicationRecord
  belongs_to :user

  CATEGORIES = [
    ["Cleaning", 0],
    ["Assembly", 1],
    ["Massage", 2],
    ["Computer", 3],
    ["Handyman", 4],
    ["Gardening", 5],
    ["Decoration", 6],
    ["Others", 7]
  ]

  COMPLETED = "completed".freeze

  scope :scoped, -> { order("created_at DESC") }
  scope :by_user, ->(id) { where(user_id: id) }
  scope :completed, -> { where(status: COMPLETED) }

  class << self

    def search(args)
      if args.blank? then scoped
      else
        self.by_category(args[:category])
            .by_location(args[:location])
            .by_text(args[:text])
      end
    end

    def by_category(category)
      return scoped if category.blank?
      where("category_ids LIKE ?", category)
    end

    def by_location(location)
      return scoped if location.blank?
      where("location LIKE ?", location)
    end

    def by_text(text)
      return scoped if text.blank?
      where("title LIKE :text", text: "%#{text}%")
    end

  end
end
