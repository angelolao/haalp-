class AddIntroctionToOffersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :introduction, :text, after: :task_id
    add_column :offers, :status, :string, after: :introduction
  end
end
