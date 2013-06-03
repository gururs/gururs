class Talk < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :title, :event, presence: true

  def video?
    video_code.present?
  end

  def audio?
    audio_code.present?
  end
end
