class Event < ActiveRecord::Base
  validates :name, :enroll_url, presence: true
end
