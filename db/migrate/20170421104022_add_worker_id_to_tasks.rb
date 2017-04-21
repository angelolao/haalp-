class AddWorkerIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :worker_id, :integer
  end
end
