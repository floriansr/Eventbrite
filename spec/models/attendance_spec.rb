require 'rails_helper'

RSpec.describe Attendance, type: :model do
 
   before(:each) do 
    @attendance = FactoryBot.create(:attendance)
  end



  context "validations" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "#some_attribute" do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
    end

  end

  context "associations" do

    describe "events" do

      it "should have_many events" do
        expect(FactoryBot.create(:attendance)).to belong_to(:event)
        end
    end

        describe "users" do

      it "should have_many users" do
        expect(FactoryBot.create(:attendance)).to belong_to(:user)
        end
    end

  end

  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end

  context "public instance methods" do

    describe "#some_method" do
      # teste cette méthode
    end

  end

  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end
end
