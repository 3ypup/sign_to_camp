class AddAuthorToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :author, :string
  end
end
