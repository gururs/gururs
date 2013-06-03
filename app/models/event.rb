class Event < ActiveRecord::Base
  has_many :talks
  validates :name, :enroll_url, presence: true
end
