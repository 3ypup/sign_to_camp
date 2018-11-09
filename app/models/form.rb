class Form < ApplicationRecord


  validates :name_child, presence: {:message => "Введите имя подростка!"}
  validates :date_of_birth, presence: {:message => "Введите дату рождения подростка!"}
  validates :name_parent, presence: {:message => "Введите имя родителей(опекунов)!"}
  validates :phones_parent, presence: {:message => "Введите контакты родителей(опекунов)!"}
  validates :phone_child, presence: {:message => "Введите телефон подростка!"}
  validates :adress, presence: {:message => "Введите домашний адрес!"}
  validates :photo_child, presence: {:message => "Добавьте фотографию подростка!"}
  validates :photo_passport, presence: {:message => "Добавьте скан документа удостоверяющего личность!"}
  validates :medical, presence: {:message => "Добавьте скан медицинского полиса!"}



end
