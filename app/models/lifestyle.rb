class Lifestyle < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user

  has_many :bookings
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
