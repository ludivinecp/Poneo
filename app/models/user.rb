class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :centre
  has_many :bookings
  # validates_presence_of  :nickname, :first_name, :last_name, :level, :phone
  # mount_uploader :avatar, AvatarUploader
end
