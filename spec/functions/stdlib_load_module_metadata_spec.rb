require 'spec_helper'

describe 'stdlib::load_module_metadata' do
  let(:prefix) { 'C:' if Puppet::Util::Platform.windows? }
  let(:module_dir) { "#{prefix}/path/to/module/" }
  let(:metadata_file) { File.join(module_dir, 'metadata.json') }

  RSpec::Matchers.define_negated_matcher :neq, :eq
  before :each do
    # avoid breaking the rest of puppet
    allow(File).to receive(:read).with(%r{\/metadata.json}, any_args).and_call_original
    allow(File).to receive(:exist?).with(neq(metadata_file)).and_call_original

    # setup access to the virtual `science` module and its metadata.json
    allow(Puppet::Module).to receive(:find).with('science', any_args).and_return(OpenStruct.new(:path => module_dir))
    allow(File).to receive(:exist?).with(metadata_file).and_return(true)
  end

  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }

  it 'parses the file' do
    allow(File).to receive(:exist?).with(metadata_file).and_return(true)
    allow(File).to receive(:read).with(metadata_file).and_return('{"name": "spencer-science"}')

    is_expected.to run.with_params('science').and_return('name' => 'spencer-science')
  end

  context 'when there is no metadata.json' do
    before :each do
      allow(File).to receive(:exist?).with(metadata_file).and_return(false)
    end

    it { is_expected.to run.with_params('science').and_raise_error(Puppet::ParseError, 'load_module_metadata(): No metadata.json file for module science') }

    it { is_expected.to run.with_params('science', true).and_return({}) }
  end
end
