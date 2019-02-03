class Listing < ApplicationRecord
  belongs_to :admin, foreign_key: "admin_id", class_name: "User"
  belongs_to :city
  has_many :reservations
  has_many :guests, foreign_key: "guest_id", class_name: "User", through: :reservations
end
