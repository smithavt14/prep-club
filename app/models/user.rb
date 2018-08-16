class User < ApplicationRecord
  has_many :preps
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :photo, :location, :bio, presence: true

  def nicetime
    self.created_at.strftime("%B %Y")
  end

end
