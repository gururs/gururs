class Talk < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :title, :event, presence: true
  scope :with_video, -> { where("video_code != ''") }
  scope :with_audio, -> { where("audio_code != ''") }
  scope :without_media, -> { where(video_code: nil, audio_code: nil) }

  def video?
    video_code.present?
  end

  def audio?
    audio_code.present?
  end

  def no_media?
    ! (video? || audio?)
  end
end
