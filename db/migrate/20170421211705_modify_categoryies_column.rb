class ModifyCategoryiesColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :category_ids, :text
  end
end
