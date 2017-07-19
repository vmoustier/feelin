class Image < ActiveRecord::Base
  belongs_to :mood
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  
  private
  
  def picture_size
    if picture_size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
end
