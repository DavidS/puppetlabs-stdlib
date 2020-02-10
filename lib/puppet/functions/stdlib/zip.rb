# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# zip.rb
#
# ---- original file header ----
#
# @summary
#       @summary
#      Takes one element from first array and merges corresponding elements from second array.
#
#    @return
#      This generates a sequence of n-element arrays, where n is one more than the count of arguments.
#
#    @example
#      zip(['1','2','3'],['4','5','6'])
#      Would result in: ["1", "4"], ["2", "5"], ["3", "6"]
#
#
Puppet::Functions.create_function(:'stdlib::zip') do
  # @param arguments
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :arguments
  end

  def default_impl(*arguments)
    # Technically we support three arguments but only first is mandatory ...
    raise(Puppet::ParseError, "zip(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2

    a = arguments[0]
    b = arguments[1]

    unless a.is_a?(Array) && b.is_a?(Array)
      raise(Puppet::ParseError, 'zip(): Requires array to work with')
    end

    flatten = call_function('stdlib::str2bool', arguments[2]) if arguments[2]

    result = a.zip(b)
    result = flatten ? result.flatten : result

    result
  end
end
