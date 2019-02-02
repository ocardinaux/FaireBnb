class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Give me your adress please" }
    
    validates :phone_number,
    presence: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Give me a valid phone number please" }
    
  has_many :listings, optional: true, dependent: :destroy, foreign_key: 'admin_id', class_name: "Listing"
  has_many :reservations, optional: true, dependent: :destroy, foreign_key: 'guest-id', class_name: "Reservation"
end
