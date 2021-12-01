class AddHistoryToForms < ActiveRecord::Migration[5.2]
  def change
  	add_column :forms, :history, :text
  end
end
