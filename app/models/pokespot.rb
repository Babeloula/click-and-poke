class Pokespot < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :pokemon_type, presence: true
  validates :scarcity_drop_level, presence: true
end
