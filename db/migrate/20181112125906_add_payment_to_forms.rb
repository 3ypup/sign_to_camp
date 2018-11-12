class AddPaymentToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :payment, :integer
  end
end
