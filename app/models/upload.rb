class Upload < ActiveRecord::Base
    ratyrate_rateable "rating"

  attr_accessor :avatar
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

end
