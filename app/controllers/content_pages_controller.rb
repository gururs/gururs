class ContentPagesController < ApplicationController
  def home
    @events      = Event.next.limit(3)
    @video_talks = Talk.with_video.last(3)
  end

  def about
    @managers = User.where("admin = ? AND admin_time_to IS NULL ", true)
    @ex_managers = User.where("admin = ? AND admin_time_to IS NOT NULL ", true)
  end
end
