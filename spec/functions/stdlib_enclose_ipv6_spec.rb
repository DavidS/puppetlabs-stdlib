require 'spec_helper'

describe 'stdlib::enclose_ipv6' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(ArgumentError, %r{'stdlib::enclose_ipv6' expects 1 argument, got none}) }
  it { is_expected.to run.with_params('argument1', 'argument2').and_raise_error(ArgumentError, %r{'stdlib::enclose_ipv6' expects 1 argument, got 2}) }
  it { is_expected.to run.with_params('garbage').and_raise_error(Puppet::ParseError, %r{enclose_ipv6\(\): Wrong argument given garbage is not an ip address.}) }
  it {}

  [
    ['127.0.0.1', ['127.0.0.1']],
    ['*', ['*']],
    ['fe80::1', ['[fe80::1]']],
    [['127.0.0.1', 'fe80::1', '[fe80::1]', '[fe80::2]'], ['127.0.0.1', '[fe80::1]', '[fe80::2]']],
  ].each do |input, output|
    it { is_expected.to run.with_params(input).and_return(output) }
  end

  [
    ['127..0.0.1', 'enclose_ipv6(): Wrong argument given 127..0.0.1 is not an ip address.'],
    ['[127.0.0.1]', 'enclose_ipv6(): Wrong argument given [127.0.0.1] is not an ip address.'],
    ['fe80:::1', 'enclose_ipv6(): Wrong argument given fe80:::1 is not an ip address.'],
  ].each do |input, error_message|
    it { is_expected.to run.with_params(input).and_raise_error(Puppet::ParseError, %r{#{Regexp.escape(error_message)}}) }
  end
end
