class ChangeColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :type
    add_column :users, :user_type, :string
  end
end
