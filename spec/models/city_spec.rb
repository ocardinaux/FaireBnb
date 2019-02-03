require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do 
		@city = FactoryBot.create(:city)  	
  end

  it "has a valid factory" do
    expect(build(:city)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si la ville est bien valide
      expect(@city).to be_a(City)
    end
    describe "#name" do
      # vérifie la présence de name
      it { expect(@city).to validate_presence_of(:name) }
		end
		describe "#zip_code" do
      # vérifie la présence de zip_code
      it { expect(@city).to validate_presence_of(:zip_code) }
      # vérifie l'unicité de zip_code
      pending "vérifie l'unicité de zip_code"
      # verifie différentes valeurs de zip_code qui doivent être correctes
      pending "verifie différentes valeurs de zip_code qui doivent être correctes"
      it { expect(@city.zip_code).tp match(/\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/) }
      # vérifie différentes valeurs de zip_code qui ne doivent pas être correctes
	  end
  end

  context "associations" do
    # vérifie qu'une ville a plusieurs logements
    it { expect(@city).to have_many(:listings)}
  end

end
