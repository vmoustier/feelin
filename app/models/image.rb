class Image < ActiveRecord::Base
  belongs_to :mood
  mount_uploader :picture, PictureUploader

end
