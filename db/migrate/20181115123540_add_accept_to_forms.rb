class AddAcceptToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :accept, :integer
  end
end
