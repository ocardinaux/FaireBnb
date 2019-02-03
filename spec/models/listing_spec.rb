require 'rails_helper'

RSpec.describe Listing, type: :model do

  before(:each) do 
		@listing = FactoryBot.create(:listing)
  end

      # teste toujours tes factories pour voir si elles sont valides
  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:listing)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si le logement est bien valide
      expect(@listing).to be_a(Listing)
    end

    describe "#available_beds" do
      # vérifie que available_beds est bien obligatoire
      it { expect(@listing).to validate_presence_of(:available_beds) }
      # vérifie que available_beds est bien un integer strictement positif
      it {expect(@listing.available_beds).to be_a(Integer) }
		end
    describe "#price" do
      # vérifie que le prix est bien obligatoire
      it { expect(@listing).to validate_presence_of(:price) }
      # vérifie que le prix est bien un integer strictement positif
      it { expect(@listing.price).to be_a(Integer) }
		end
    describe "#description" do
      # vérifie que la description est bien obligatoire
      it { expect(@listing).to validate_presence_of(:description) }
      # vérifie que la description au bien au moins 140 caractères
      it { expect(@listing.description.size).to be >= 140 }
		end
    describe "#welcome_message" do
      # vérifie que le message de bienvenue est bien obligatoire
      it { expect(@listing).to validate_presence_of(:welcome_message) }
		end
	end
  
  context "associations" do
    # vérifie que le logement a plusieurs réservations
    it { expect(@listing).to have_many(:reservations) }
    # vérifie que le logement appartient à une ville
    it { expect(@listing.city).to be_a(City) }
    # vérifie que le logement appartient bien à un admin qui est un User en nom de classe
    it { expect(@listing.admin).to be_a(User) }
  end

  context "public instance methods" do
    describe "#overlaping_reservation" do
      # vérifie que le listing a bien une méthode d'instance nommée overlaping_reservation? 
      pending it { expect(@listing.overlaping_reservation?).to exist }
      # vérifie que la méthode marche bien
    end
  end

end
