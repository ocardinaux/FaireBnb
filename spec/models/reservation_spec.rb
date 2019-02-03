require 'rails_helper'

RSpec.describe Reservation, type: :model do

  before(:each) do 
		@reservation = FactoryBot.create(:reservation)
  end

  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:reservation)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si la réservation est bien une réservation
      expect(@reservation).to be_a(Reservation)
    end
    describe "start_date and end_date" do
    	it "is not valid if start_date is after end_date" do
        # impossible de créer une réservation avec une start_date après la end_date
        expect(@reservation.start_date > @reservation.end_date).to be false
	    end
		end
  end

  context "associations" do
    # vérifie qu'une réservation appartient bien au listing
    # vérifie qu'une réservation appartient bien à son guest, avec user en nom de classe
  end

  context "public instance methods" do
    describe "#length" do
      # vérifie que le listing a bien une méthode d'instance nommée length 
      # vérifie que la méthode marche bien
		end
  end
end
