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
    
  


  # methods
  #find_by_credentials
  #generate_sesssion_token
  #reset_session_token!
  #password=(password)
  #is_password?


end
