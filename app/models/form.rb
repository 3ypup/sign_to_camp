class Form < ApplicationRecord
acts_as_xlsx



  validates :name_child, presence: {:message => "Введите имя подростка!"}
  validates :date_of_birth, presence: {:message => "Введите дату рождения подростка!"}
  validates :name_parent, presence: {:message => "Введите имя родителей(опекунов)!"}
  validates :phones_parent, presence: {:message => "Введите контакты родителей(опекунов)!"}
  validates :phone_child, presence: {:message => "Введите телефон подростка!"}
  validates :phone_child, presence: {:message => "Введите телефон подростка!"}
  validates :email, presence: {:message => "Введите адрес электронной почты!"}
  validates :adress, presence: {:message => "Введите домашний адрес!"}
  validates :food_allergy, presence: {:message => "Введите информацию по пищевым ограничениям!"}
  validates :psycho, presence: {:message => "Напишите, пожалуйста, Наблюдался ли ваш ребенок у невролога, психиатра!"}
  validates :events, presence: {:message => "Напишите, пожалуйста, происходили ли в жизни подростка за последний год важные события !"}
  validates :also, presence: {:message => "Напишите, пожалуйста, есть ли дополнительная информация, которую Вы хотите сообщить организаторам!"}
  validates :bonus_contacts, presence: {:message => "Напишите, пожалуйста, есть ли дополнительные телефоны и контактные лица, с которыми организаторы могут связаться!"}
  validates :photo_child, presence: {:message => "Добавьте фотографию подростка!"}
  validates :photo_passport, presence: {:message => "Добавьте скан документа удостоверяющего личность!"}
  validates :photo_medical, presence: {:message => "Добавьте скан медицинского полиса!"}
  
  validates :sex, presence: {:message => "Введите пол подростка!"}
  validates :passport, presence: {:message => "Введите номер пасспорта или другого документа, удостоверяющего личность!"}



  validates_format_of :photo_child,  :with => %r{(png|jpg|jpeg)}i, :message => "Можно прикреплять изображения только формата jpg и png !!"
  validates_format_of :photo_passport,  :with => %r{(png|jpg|jpeg)}i, :message => "Можно прикреплять изображения только формата jpg и png !!"
  validates_format_of :photo_medical,  :with => %r{(png|jpg|jpeg)}i, :message => "Можно прикреплять изображения только формата jpg и png !!"

    validates :photo_child, file_size: { less_than: 20.megabytes, message: 'Загрузите, пожалуйста, фото меньшего размера. Не больше двадцати мегабайт' }
    validates :photo_passport, file_size: { less_than: 20.megabytes, message: 'Загрузите, пожалуйста, фото паспорта меньшего размера. Не больше двадцати мегабайт' }
    validates :photo_medical, file_size: { less_than: 20.megabytes, message: 'Загрузите, пожалуйста, фото медицинского полиса меньшего размера. Не больше двадцати мегабайт' }

  validates_numericality_of :accept, :equal_to => 1, :message => "Необходимо согласиться с условиями обработки данных для продолжения!"

mount_uploader :photo_child, PchildUploader
mount_uploader :photo_passport, PpassportUploader
mount_uploader :photo_medical, PmedicalUploader

belongs_to :user
end
