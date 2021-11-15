class AddPassportToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :passport, :text
    add_column :forms, :sex, :text
  end
end
