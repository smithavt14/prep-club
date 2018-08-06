class Prep < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
