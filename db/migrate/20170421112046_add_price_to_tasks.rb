class AddPriceToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :price, :decimal
    add_column :tasks, :worker_number, :integer
  end
end
