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

  scope :scoped, -> { order("created_at DESC") }

  class << self

    def search(args)
      if args.blank? then scoped
      else
        self.by_category(args[:category])
      end
    end

    def by_category(category)
      return scoped if category.blank?
      where("category_ids LIKE ?", category)
    end

  end
end
