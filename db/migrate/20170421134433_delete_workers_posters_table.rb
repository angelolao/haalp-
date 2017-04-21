class DeleteWorkersPostersTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :workers
    drop_table :posters
    add_column :users, :category_ids, :string
  end
end
