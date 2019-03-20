class Article < ApplicationRecord
  belongs_to :user
  has_many :comments


  mount_uploader :main_picture, PhotoUploader
  mount_uploader :sub_picture1, PhotoUploader
  mount_uploader :sub_picture_2, PhotoUploader
  mount_uploader :sub_picture3, PhotoUploader
  mount_uploader :sub_picture4, PhotoUploader
end
