class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :pokespots, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :clients_booking, through: :pokespots, source: :bookings

  RANK = ["Noob", "Great", "Ultra", "Master"]

  after_commit :add_default_image, on: %i[create update]

  def add_default_image
    unless photo.attached?
      photo.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'user', ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg', '9.jpg', '10.jpg'].sample)),
        filename: 'pokeballdefault.svg.png', content_type: 'image/png'
      )
    end
  end
end
