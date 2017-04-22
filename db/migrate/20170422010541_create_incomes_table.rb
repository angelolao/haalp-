class CreateIncomesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.integer :user_id
      t.integer :poster_id
      t.integer :task_id
      t.float :income
      t.string  :owned

      t.timestamps
    end
  end
end
