class ContentPagesController < ApplicationController
  def home
    @events      = Event.next.limit(3)
    @video_talks = Talk.with_video.last(3)
  end

  def about
    @managers = User.where(admin: true)
  end
end
