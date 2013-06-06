require 'spec_helper'

describe ApplicationHelper do
  let(:talk) { double(video_code: '8_WHlskbwnc') }

  describe "video_thumb_image" do
    it "returns a image from the YouTube's video based on parameters' video_code attribute" do
      expected_html = image_tag('http://img.youtube.com/vi/8_WHlskbwnc/0.jpg')
      expect(helper.video_thumb_image(talk)).to eql(expected_html)
    end
  end

  describe "video_thumb_video" do
    it "returns a video player from YouTube based on parameters' video_code attribute" do
      expected_html = "<iframe allowfullscreen=\"true\" frameborder=\"0\" height=\"157\" src=\"https://www.youtube.com/embed/8_WHlskbwnc\" width=\"280\"></iframe>"
      expect(helper.video_thumb_video(talk)).to eql(expected_html)
    end
  end
end
