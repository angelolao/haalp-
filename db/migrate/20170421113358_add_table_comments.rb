class AddTableComments < ActiveRecord::Migration[5.0]
  def change
    create_table  :comments do |t|
      t.integer   :task_id,              null: false
      t.integer   :user_id,              null: false
      t.integer   :poster_user_id,       null: false
      t.integer   :rating,               null: false
      t.timestamps  null: false
    end

    rename_column :offers,  :worker_id, :worker_user_id
    rename_column :tasks,   :poster_id, :poster_user_id
  end
end
