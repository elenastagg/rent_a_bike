require 'scooter'

describe Scooter do
  it { is_expected.to respond_to :working? }

  it 'is working' do
    expect(subject).to be_working
  end
end
