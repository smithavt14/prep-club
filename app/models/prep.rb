class Prep < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :location, presence: true


  def check_max_participants?
    self.bookings.count < self.max_participants
  end

  def check_booking_status?(current_user)
    booking_users = []
    self.bookings.each do |booking|
      booking_users << booking.user
    end
    booking_users.include?(current_user)
  end

  def check_event_time?
    self.time < Time.now
  end
end
