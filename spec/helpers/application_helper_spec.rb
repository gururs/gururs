require 'spec_helper'

describe ApplicationHelper do
  describe "video_thumb_image" do
    let(:talk) { double(video_code: '8_WHlskbwnc') }

    it "returns a image from the YouTube's video based on video_code attribute of the parameter" do
      expected_html = image_tag('http://img.youtube.com/vi/8_WHlskbwnc/0.jpg')
      expect(helper.video_thumb_image(talk)).to eql(expected_html)
    end
  end
end
