class Lifestyle < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :users, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
