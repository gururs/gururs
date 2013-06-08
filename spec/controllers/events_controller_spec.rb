require 'spec_helper'

describe EventsController do
  let(:event) { Event.make! }

  describe "GET index" do
    it "assigns all events as @events" do
      event.save
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it "orders @events by happens_at attribute DESC" do
      first_event = Event.make!(happens_at: 1.month.from_now)
      last_event  = Event.make!(happens_at: 2.months.from_now)
      get :index
      expect(assigns(:events).to_a).to eq([last_event, first_event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event.save
      get :show, id: event.to_param
      expect(assigns(:event)).to eq(event)
    end
  end
end
