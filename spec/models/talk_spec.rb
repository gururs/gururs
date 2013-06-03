require 'spec_helper'

describe Talk do
  describe 'Validations' do
    it { should validate_presence_of :event }
    it { should validate_presence_of :title }
  end

  describe 'Associations' do
    it { should belong_to :event }
    it { should belong_to :user }
  end
end
