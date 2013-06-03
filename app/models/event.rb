class Event < ActiveRecord::Base
  has_many :talks

  validates :name, :enroll_url, :happens_at, presence: true

  scope :next, -> { where('happens_at >= ?', DateTime.now).
                    order('happens_at ASC') }
end
