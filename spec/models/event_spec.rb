require 'spec_helper'

describe Event do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:enroll_url) }
  end

  describe 'Associations' do
    it { should have_many :talks }
  end

end
