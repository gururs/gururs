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

  describe '#video?' do
    context 'when video code is present' do
      subject { Talk.make! video_code: 123 }
      it { expect(subject.video?).to be_true }
    end

    context 'when video code is not present' do
      subject { Talk.make! video_code: nil }
      it { expect(subject.video?).to be_false }
    end
  end

  describe '#audio?' do
    context 'when audio code is present' do
      subject { Talk.make! audio_code: 123 }
      it { expect(subject.audio?).to be_true }
    end

    context 'when audio code is not present' do
      subject { Talk.make! audio_code: nil }
      it { expect(subject.audio?).to be_false }
    end
  end

  describe 'Scopes' do
    describe '.with_video' do
      before do
        2.times { Talk.make! video_code: 123, audio_code: nil }
        Talk.make! video_code: nil
      end
      it { expect(Talk.with_video).to have(2).videos }
    end

    describe '.with_audio' do
      before do
        2.times { Talk.make! audio_code: 123, video_code: nil }
        Talk.make! audio_code: nil
      end
      it { expect(Talk.with_audio).to have(2).videos }
    end
  end
end
