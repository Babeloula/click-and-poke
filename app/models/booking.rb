class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokespot
  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: {
    Pending: 0,
    Accepted: 1,
    Declined: 2
  }, _prefix: true
end
