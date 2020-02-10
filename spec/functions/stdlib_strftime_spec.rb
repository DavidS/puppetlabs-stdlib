require 'spec_helper'

describe 'stdlib::strftime' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, 'strftime(): Wrong number of arguments given (0 for 1)') }

  context 'with a specific systemtime' do
    let(:fixed_time) { instance_double(Time, 'fixed_time') }

    before(:each) do
      allow(Time).to receive(:new).and_return(fixed_time).once
    end
    it 'using %s should be higher then when I wrote this test' do
      allow(fixed_time).to receive(:strftime).with('format').and_return('result')
      is_expected.to run.with_params('format').and_return('result')
    end
  end
end
