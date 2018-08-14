class Prep < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  acts_as_taggable_on :tags

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :time, :location, :recipe_name, presence: true

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

  def most_used_tags
    most_used_tags = []
    ActsAsTaggableOn::Tag.most_used(3).each do |tag|
      most_used_tags << tag.name
    end
    most_used_tags
  end

  def nicetime
    self.time.strftime("%l:%M %p, %b %e")
  end

  def check_user_booking_status?(current_user)
    bookings_users = []
    self.bookings.each do |booking|
      bookings_users << booking.user
    end
    bookings_users.include?(current_user)
  end
end
