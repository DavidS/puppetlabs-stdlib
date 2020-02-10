# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# validate_domain_name.rb
#
# ---- original file header ----
#
# @summary
#       @summary
#      Validate that all values passed are syntactically correct domain names.
#      Fail compilation if any value fails this check.
#
#    @return
#      passes when the given values are syntactically correct domain names or raise an error when they are not and fails compilation
#
#    @example **Usage**
#
#      The following values will pass:
#
#          $my_domain_name = 'server.domain.tld'
#          validate_domain_name($my_domain_name)
#          validate_domain_name('domain.tld', 'puppet.com', $my_domain_name)
#
#      The following values will fail, causing compilation to abort:
#
#          validate_domain_name(1)
#          validate_domain_name(true)
#          validate_domain_name('invalid domain')
#          validate_domain_name('-foo.example.com')
#          validate_domain_name('www.example.2com')
#
#
Puppet::Functions.create_function(:'stdlib::validate_domain_name') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end

  def default_impl(*args)
    rescuable_exceptions = [ArgumentError]

    if args.empty?
      raise Puppet::ParseError, "validate_domain_name(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      raise Puppet::ParseError, "#{arg.inspect} is not a string." unless arg.is_a?(String)

      begin
        raise Puppet::ParseError, "#{arg.inspect} is not a syntactically correct domain name" unless call_function('is_domain_name', arg)
      rescue *rescuable_exceptions
        raise Puppet::ParseError, "#{arg.inspect} is not a syntactically correct domain name"
      end
    end
  end
end
