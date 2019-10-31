# frozen_string_literal: true

require 'scooter'

describe Scooter do
  it { is_expected.to respond_to :working? }

  it 'is working' do
    expect(subject).to be_working
  end

  describe '#report_broken' do
    it { is_expected.to respond_to :report_broken }

    it 'is not working' do
      subject.report_broken
      expect(subject).to_not be_working
    end
  end

  describe '#fix' do
    it { is_expected.to respond_to :fix }

    it 'can only fix a broken scooter' do
      expect { subject.fix }.to raise_error('This scooter is already working.')
    end

    it 'switched a broken scooter to working' do
      subject.report_broken
      subject.fix
      expect(subject).to be_working
    end
  end
end
