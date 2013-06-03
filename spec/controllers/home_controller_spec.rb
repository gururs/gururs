require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "assigns next events as @events" do
      Event.should_receive(:next).and_return(double.as_null_object)
      get :index
    end

    it "assigns at most 3 events as @events" do
      4.times { Event.make! }
      get :index
      expect(assigns(:events)).to have(3).items
    end

    it "assigns at most 3 talks as @video_talks" do
      4.times { Talk.make! video_code: 123 }
      get :index
      expect(assigns(:video_talks)).to have(3).talks
    end

    it "include just video talks in @video_talks collection" do
      2.times { Talk.make! video_code: 123 }
      Talk.make! video_code: nil
      get :index
      expect(assigns(:video_talks)).to have(2).talks
    end
  end
end
