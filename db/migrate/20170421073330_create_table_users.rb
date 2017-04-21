class CreateTableUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
    add_column :users, :skype, :string
    add_column :users, :image, :string

    create_table  :workers do |t|
      t.integer   :user_id,       null: false
      t.string    :category_ids
      t.timestamps  null: false
    end

    create_table  :posters do |t|
      t.integer  :user_id
      t.timestamps null: false
    end

    create_table  :tasks do |t|
      t.integer   :poster_id,     null: false
      t.integer   :status,        null: false
      t.string    :title,         null: false
      t.string    :due_date,      null: false
      t.string    :description,   null: false
      t.string    :location,      null: false
      t.string     :category_ids
      t.timestamps null: false
    end

    create_table  :offers do |t|
      t.integer   :worker_id,     null: false
      t.integer   :task_id,       null: false
      t.timestamps null:false
    end

    create_table  :category do |t|
      t.string    :title,         null: false
      t.string    :description,   null: false
      t.timestamps null:false
    end
  end
end
