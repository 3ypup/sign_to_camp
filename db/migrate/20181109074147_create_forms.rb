class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|

      t.text :name_child
      t.datetime :date_of_birth
      t.text :name_parent
      t.text :phones_parent
      t.text :phone_child
      t.text :adress
      t.text :email
      t.text :food_allergy
      t.text :vegan
      t.text :psycho
      t.text :events
      t.text :also
      t.text :bonus_contacts
      t.text :friends

      t.string :photo_child
      t.string :photo_passport
      t.string :medical




      t.string :image

      

      t.timestamps
    end
  end
end
