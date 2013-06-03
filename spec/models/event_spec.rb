require 'spec_helper'

describe Event do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:enroll_url) }
  end
end
