module ApplicationHelper
  def video_thumb_image(entity_with_video)
    image_tag("http://img.youtube.com/vi/#{entity_with_video.video_code}/0.jpg")
  end

  def video_thumb_video(entity_with_video)
    content_tag('iframe', nil, width:           '280',
                               height:          '157',
                               frameborder:     '0',
                               allowfullscreen: true,
                               src:             "https://www.youtube.com/embed/#{entity_with_video.video_code}")
  end

  def audio_thumb_audio(entity_with_audio)
    content_tag('iframe', nil, width:           '500',
                               height:          '160',
                               frameborder:     'no',
                               src:             "https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%#{entity_with_audio.audio_code}")
  end
end