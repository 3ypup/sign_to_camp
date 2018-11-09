class Form < ApplicationRecord

  validates :author, presence: true
  validates :title, :length => {:maximum => 20, :message => "Слишком длинная тема встречи !!"} 
  validates :author, presence: true
  validates :content, presence: {:message => "Опишите событие!!"}
  validates :content, :length => {:maximum => 2000, :message => "Слишком много текста!!"}
  validates :date, presence: {:message => "Выберите дату!!"}
  validates :image, presence: {:message => "Выберите обложку встречи!!"}


mount_uploader :image, EventimageUploader
end
