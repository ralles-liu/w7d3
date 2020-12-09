require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryBot.build(:user,
      username: "ralles",
      password: "good_password")
  end


  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end


  it "creates a session token before validation" do 
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "::find_by_credentials" do
    before {user.save!}

    it "find the user with the correct info" do
      expect(User.find_by_credentials("ralles", "good_password")).to eq(User.last)
    end

    it "return nil if given wrong info" do
      expect(User.find_by_credentials("ralles", "adfadfaf")).to eq(nil) 
      expect(User.find_by_credentials("ralles_wrong", "good_password")).to eq(nil)   
    end
  end

    describe "#reset_session_token!" do 
      
      it "should create a new session token" do 
          expect(user.session_token).to_not be_nil
          old_token = user.session_token
          user.reset_session_token!
          expect(user.session_token).to_not eq(old_token)
      end
    end

    describe "#is_password?" do 

      it "tests if our user's password is correct" do 

        expect(is_password?("good_password")).to be true
        expect(is_password?("password")).to be false
      end
    end

  
    
  


  # methods
  #find_by_credentials done
  #generate_sesssion_token hekper
  #reset_session_token!
  #password=(password)
  #is_password?


end
