class Pokespot < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :pokemon_type, presence: true
  validates :scarcity_drop_level, presence: true

  TYPES = ["Fire", "Water", "Grass", "Electric", "Poison", "Rock"]

  after_commit :add_default_image, on: %i[create update]

  def add_default_image
    unless photo.attached?
      photo.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'pokecover', ['2.jpg', '3.jpg', '4.png', '5.jpg', '6.jpg', '7.png', '8.jpg', '11.jpeg', '12.jpeg', '13.jpeg', '14.jpeg', '15.jpeg', '16.jpeg', '17.jpeg', '18.jpeg', '19.png', '20.jpeg', '21.jpeg'].sample)),
        filename: 'pokeballdefault.svg.png', content_type: 'image/png'
      )
    end
  end
end
