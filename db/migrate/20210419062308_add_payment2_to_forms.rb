class AddPayment2ToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :payment2, :string
    add_column :forms, :payment3, :string
  end
end
