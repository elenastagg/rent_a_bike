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
end
