class ModidyDuteDate < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :price, :float
    change_column :tasks, :due_date, :datetime

    rename_column :offers, :worker_user_id, :user_id
  end
end
