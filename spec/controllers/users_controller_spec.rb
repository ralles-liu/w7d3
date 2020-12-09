require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST#create" do 
    context "when user enters valid info" do
        
        it "should redirect user to sign-in page" do 
         post :create, params: {username: "Jack", password: "password"}
         expect(response).to redirect_to(new_session_url)
         expect(response).to have_http_status(302) 

        end
    end
    context "when user enters invalid info" do
        it "should redirect to User registration form" do 
          post :create, params: {username: "Jack"}
          expect(response).to redirect_to(new_user_url)
          expect(flash[:error]).to be_present
          expect(response).to have_http_status(302) 
         end 
    end
end
     describe "Get#New" do
            
     end

end