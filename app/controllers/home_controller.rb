class HomeController < ApplicationController
  def index
    @events      = Event.next.limit(3)
    @video_talks = Talk.last(3)
  end
end
