class AddNotesToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :notes, :text
    add_column :forms, :validation, :integer
  end
end
