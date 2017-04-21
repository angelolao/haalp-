class RenameCategoryTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :category, :categories
  end
end
