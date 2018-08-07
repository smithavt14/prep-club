class Prep < ApplicationRecord
  belongs_to :user
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :location, presence: true


  def check_max_participants?
    self.bookings.count < self.max_participants
  end
end
