class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  belongs_to :lifestyle, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :bookings
end
