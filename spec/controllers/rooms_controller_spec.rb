require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  describe "GET new_room" do
    it "returns http success" do
      get :new_room
      expect(response).to have_http_status(:success)
    end
  end

end
