class AddArchiveToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :archive, :string, default: false
  end
end
