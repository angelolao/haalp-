class AddLocationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :location, :string, after: :status
  end
end