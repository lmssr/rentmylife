class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lifestyle

  validates :comment, length: { minimum: 20 }
end
