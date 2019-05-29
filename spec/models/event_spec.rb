require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do 
    @event = FactoryBot.create(:event)
  end



  context "validations" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end


#-----------------------------------ATTRIBUTES--------------------------------------------------------

    describe "duration" do

      it "should not be valid if the duration is not a multiple of 5" do
        bad_event = FactoryBot.build(:event, duration: 27)
        expect(bad_event).not_to be_valid
      end

      it "should not be valid if the duration is not strictly greater than 0" do
        bad_event = FactoryBot.build(:event, duration: 0)
        expect(bad_event).not_to be_valid
      end

    end



    describe "start_date" do

      it "should not be valid if the start_date is in the past" do
        bad_event = FactoryBot.build(:event, start_date: Faker::Time.backward(14, :evening))
        expect(bad_event).not_to be_valid
      end

     end


    describe "title" do

      it "should not be valid if it is shorter than 5 characters" do
        bad_event = FactoryBot.build(:event, title: "lol")
        expect(bad_event).not_to be_valid
      end

      it "should not be valid if it is longer than 140 characters" do
        bad_event = FactoryBot.build(:event, title: Faker::Lorem.characters(150))
        expect(bad_event).not_to be_valid
      end      

     end    


    describe "price" do

      it "should not be valid if it is lower than 1" do
        bad_event = FactoryBot.build(:event, price: 0)
        expect(bad_event).not_to be_valid
      end

      it "should not be valid if it is higher than 1000" do
        bad_event = FactoryBot.build(:event, price: 1001)
        expect(bad_event).not_to be_valid
      end      

     end    

  end

#----------------------------------END ATTRIBUTES---------------------------------------


  context "associations" do

    describe "administrated events" do

      it "should belong to an administrator" do
      user = FactoryBot.build(:user)
      event = FactoryBot.build(:event, admin: user)
      expect(event.admin).to eq(user)
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
