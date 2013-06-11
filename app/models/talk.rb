class Talk < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :title, :event, presence: true
  scope :with_video, -> { where("video_code != ''") }
  scope :with_audio, -> { where("audio_code != ''") }

  def video?
    video_code.present?
  end

  def audio?
    audio_code.present?
  end
end
