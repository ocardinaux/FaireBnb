class Listing < ApplicationRecord
  belongs_to :admin, foreign_key: "admin_id", class_name: "User"
  belongs_to :city
  has_many :reservations
  has_many :guests, foreign_key: "guest_id", class_name: "User", through: :reservations

  validates :available_beds,
    presence: true,
    numericality: { only_integer: true }
  validates :price,
    presence: true,
    numericality:  { only_integer: true }
  validates :description,
    presence: true,
    length: { minimum: 10 }
  validates :welcome_message, presence: true
  
  
  # Retourne un array d'arrays des jours réservés
  def reserved_days
    puts "Hello i'm reserved!"
    @days = []
    self.reservations.each do |x|
    
      puts "#{x.start_date} - #{x.end_date}"
      @days << build_range_of_days(x.start_date, x.end_date)
    end
    return @days
  end

  # Retourne un array de dates à partir de la primère et dernière
  def build_range_of_days(starting, ending)
    starting = Date.parse(starting.to_s)
    ending = Date.parse(ending.to_s)
    (starting..ending).map { |d| d }
  end
  
  def overlapping_reservation?(starting, ending)
    already_reserved_days = reserved_days.flatten
    new_reservation = build_range_of_days(staring, ending)
    # L'intersection des deux arrays doit être vide
    (already_reserved_days & new_reservation).empty? false | true
  end
  
end
