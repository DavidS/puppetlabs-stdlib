require 'spec_helper'

describe 'stdlib::unix2dos' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(ArgumentError, "'stdlib::unix2dos' expects 1 argument, got none") }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(ArgumentError, "'stdlib::unix2dos' expects 1 argument, got 2") }
  it { is_expected.to run.with_params([]).and_raise_error(ArgumentError, "'stdlib::unix2dos' parameter 'argument' expects a String value, got Array") }
  it { is_expected.to run.with_params({}).and_raise_error(ArgumentError, "'stdlib::unix2dos' parameter 'argument' expects a String value, got Hash") }
  it { is_expected.to run.with_params(1).and_raise_error(ArgumentError, "'stdlib::unix2dos' parameter 'argument' expects a String value, got Integer") }

  context 'when converting from unix to dos format' do
    sample_text    = "Hello\nWorld\n"
    desired_output = "Hello\r\nWorld\r\n"

    it 'outputs dos format' do
      is_expected.to run.with_params(sample_text).and_return(desired_output)
    end
  end

  context 'when converting from dos to dos format' do
    sample_text    = "Hello\r\nWorld\r\n"
    desired_output = "Hello\r\nWorld\r\n"

    it 'outputs dos format' do
      is_expected.to run.with_params(sample_text).and_return(desired_output)
    end
  end
end
