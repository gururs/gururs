class HomeController < ApplicationController
  def index
    @events      = Event.limit(3)
    @video_talks = Talk.with_video.last(3)
  end
end
