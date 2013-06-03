module ApplicationHelper
  def video_thumb_image(entity_with_video)
    image_tag("http://img.youtube.com/vi/#{entity_with_video.video_code}/0.jpg")
  end
end
