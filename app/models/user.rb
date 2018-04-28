class User < ActiveRecord::Base
  searchkick
  ratyrate_rater 

  has_many :accounts
  has_many :uploads
  has_many :follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
