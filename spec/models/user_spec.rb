require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
		@user = FactoryBot.create(:user)  	
  end

  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si le user est bien valide
      expect(@user).to_be_a User
    end
    
    describe "#email" do
      # vérifie la présence de l'email
      it { expect(@user).to validate_presence_of(:email) }
      # vérifie l'unicité de l'email
      pending "vérifie l'unicité de l'email"
      # verifie différentes valeurs de l'email qui doivent être correctes
      it { expect(@user.email).to match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/) }
      # vérifie différentes valeurs de l'email qui ne doivent pas être correctes
      pending "vérifie différentes valeurs de l'email qui ne doivent pas être correctes"
    end

    describe "#phone_number" do
      # vérifie la présence du phone_number
      it { expect(@user).to validate_presence_of(:phone_number) }
      # verifie différentes valeurs du phone_number qui doivent être correctes
      it { expect(@user.email).to match(/\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/) }
      # vérifie différentes valeurs du phone_number qui ne doivent pas être correctes
      # probablement un FactoryBot.build quelquechose
	  end
  end

  context "associations" do
    # vérifie que l'utilisateur a plusieurs réservations en tant que guest
    pending { expect(@user).to have_many(:reservations) }
    # vérifie que l'utilisateur a plusieurs listings en tant qu'admin
    pending { expect(@user).to have_many(:listings) }
  end

end