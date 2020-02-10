# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
# Custom Puppet function to convert unix to dos format
# ---- original file header ----
#
# @summary
#       @summary
#      Returns the DOS version of the given string.
#
#    @return
#      the DOS version of the given string.
#
#    Takes a single string argument.
#
#
Puppet::Functions.create_function(:'stdlib::unix2dos') do
  # @param arguments
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    param 'String', :argument
  end

  def default_impl(argument)
    argument.gsub(%r{\r*\n}, "\r\n")
  end
end
