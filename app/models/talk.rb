class Talk < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :title, :event, presence: true
end
