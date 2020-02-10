# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# has_ip_network
#
# ---- original file header ----
#
# @summary
#       @summary
#      Returns true if the client has an IP address within the requested network.
#
#    @return
#      Boolean value, `true` if the client has an IP address within the requested network.
#
#    This function iterates through the 'interfaces' fact and checks the
#    'network_IFACE' facts, performing a simple string comparision.
#
#
Puppet::Functions.create_function(:'stdlib::has_ip_network') do
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
    raise(Puppet::ParseError, "has_ip_network(): Wrong number of arguments given (#{args.size} for 1)") if args.size != 1

    call_function('stdlib::has_interface_with', 'network', args[0])
  end
end
