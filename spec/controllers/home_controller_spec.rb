require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "assigns at most 3 events as @events" do
      4.times { Event.make! }
      get :index
      expect(assigns(:events)).to have(3).items
    end

    it "assigns at most 3 talks as @video_talks" do
      4.times { Talk.make! }
      get :index
      expect(assigns(:video_talks)).to have(3).items
    end

    pending "include just video talks in @video_talks collection"
  end
end
