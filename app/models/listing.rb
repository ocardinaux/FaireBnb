class Listing < ApplicationRecord

  validates :available_beds,
    presence: true,
    numericality: { only_integer: true }
  validates :price,
    presence: true,
    numericality:  { only_integer: true }
  validates :description,
    presence: true,
    length: { minimum: 140 }
  validates :welcome_message, presence: true

  belongs_to :admin, foreign_key: "admin_id", class_name: "User"
  belongs_to :city
  has_many :reservations
  has_many :guests, foreign_key: "guest_id", class_name: "User", through: :reservations

end
