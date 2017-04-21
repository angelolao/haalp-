class CreateTableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table  :users do |t|
      t.string    :name,          null: false
      t.string    :contact,        null: false
      t.string    :skype
      t.string    :image
      t.timestamps  null: false
    end

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
