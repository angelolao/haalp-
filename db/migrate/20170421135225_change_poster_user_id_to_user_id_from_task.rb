class ChangePosterUserIdToUserIdFromTask < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :poster_user_id, :user_id
  end
end
