require 'rails_helper'

RSpec.describe WelcomeController do
  let(:user) { create(:user) }
  
  describe "GET index" do
    it "will not render the index template" do
      get :index
      expect(response).to_not have_http_status :not_found
    end 
  end 

  describe 'approved user' do
    before do
      user.confirm
      sign_in user  
    end 

    describe "GET about" do
      it "renders the about template" do
        get :about
        expect(response).to render_template("about")
      end 
    end 
  end 

end 
