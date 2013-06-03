require 'spec_helper'

describe Event do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:enroll_url) }
    it { should validate_presence_of(:happens_at) }
  end

  describe 'Associations' do
    it { should have_many :talks }
  end

  describe 'Scopes' do
    describe "next" do
      it "doesn't include past events" do
        subject = described_class.make!(happens_at: -1.day.from_now)
        expect(described_class.next).to_not include(subject)
      end

      it "orders by happening date ASC" do
        subject_1 = described_class.make!(happens_at: 1.day.from_now)
        subject_3 = described_class.make!(happens_at: 3.day.from_now)
        subject_2 = described_class.make!(happens_at: 2.day.from_now)
        expect(described_class.next.to_a).to eql([subject_1, subject_2, subject_3])
      end
    end
  end
end
