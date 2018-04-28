class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessor :profilepic
  mount_uploader :profilepic, ProfilepicUploader
end
