class Pokespot < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :pokemon_type, presence: true
  validates :scarcity_drop_level, presence: true

  TYPES = ["Fire", "Water", "Grass", "Electric", "Poison", "Rock"]
end
