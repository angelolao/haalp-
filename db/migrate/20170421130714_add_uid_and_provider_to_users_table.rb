class AddUidAndProviderToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string, after: :user_type
    add_column :users, :provider, :string, after: :uid

    change_column :users, :created_at, :datetime, after: :provider
    change_column :users, :updated_at, :datetime, after: :created_at
  end
end
