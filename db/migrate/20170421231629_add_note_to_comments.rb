class AddNoteToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :note, :text
  end
end
