# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# delete_at.rb
#
# ---- original file header ----
#
# @summary
#       @summary
#      Deletes a determined indexed value from an array.
#
#    For example
#        ```delete_at(['a','b','c'], 1)```
#
#    Would return: `['a','c']`
#
#    > *Note:*
#      Since Puppet 4 this can be done in general with the built-in
#      [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter) function:
#
#      ```['a', 'b', 'c'].filter |$pos, $val | { $pos != 1 }```
#
#    Or if a delete is wanted from the beginning or end of the array, by using the slice operator [ ]:
#      ```
#      $array[0, -1] # the same as all the values
#      $array[2, -1] # all but the first 2 elements
#      $array[0, -3] # all but the last 2 elements
#      $array[1, -2] # all but the first and last element
#      ```
#
#    @return [Array] The given array, now missing the target value
#
#
#
Puppet::Functions.create_function(:'stdlib::delete_at') do
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
    raise(Puppet::ParseError, "delete_at(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'delete_at(): Requires array to work with')
    end

    index = arguments[1]

    if index.is_a?(String) && !index.match(%r{^\d+$})
      raise(Puppet::ParseError, 'delete_at(): You must provide non-negative numeric index')
    end

    result = array.dup

    # Numbers in Puppet are often string-encoded which is troublesome ...
    index = index.to_i

    if index > result.size - 1 # First element is at index 0 is it not?
      raise(Puppet::ParseError, 'delete_at(): Given index exceeds size of array given')
    end

    result.delete_at(index) # We ignore the element that got deleted ...

    result
  end
end
