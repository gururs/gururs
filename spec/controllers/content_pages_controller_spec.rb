require 'spec_helper'

describe ContentPagesController do
  describe "GET 'home'" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end

    it "assigns next events as @events" do
      Event.should_receive(:next).and_return(double.as_null_object)
      get :home
    end

    it "assigns at most 3 events as @events" do
      4.times { Event.make! }
      get :home
      expect(assigns(:events)).to have(3).items
    end

    it "assigns at most 3 talks as @video_talks" do
      4.times { Talk.make! video_code: 123 }
      get :home
      expect(assigns(:video_talks)).to have(3).talks
    end

    it "include just video talks in @video_talks collection" do
      2.times { Talk.make! video_code: 123 }
      Talk.make! video_code: nil
      get :home
      expect(assigns(:video_talks)).to have(2).talks
    end
  end

  describe "GET 'about'" do
    it "assigns @managers with admin users" do
      User.make!(admin: false)
      admin = User.make!(admin: true, admin_time_from: 2012)
      get :about
      expect(assigns(:managers).to_a).to eql([admin])
    end
  end
end
