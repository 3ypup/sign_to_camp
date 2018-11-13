class AddRefreshToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :refresh, :integer
  end
end
