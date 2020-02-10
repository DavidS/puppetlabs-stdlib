# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
# Test whether a given class or definition is defined
require 'puppet/parser/functions'

# ---- original file header ----
#
# @summary
#       @summary
#      Returns the value of a resource's parameter.
#
#    @return
#      value of a resource's parameter.
#
#    Takes a resource reference and name of the parameter and
#    returns value of resource's parameter. Note that user defined
#    resource types are evaluated lazily.
#
#    @example Example Usage:
#
#      # define a resource type with a parameter
#      define example_resource($param) {
#      }
#
#      # declare an instance of that type
#      example_resource { "example_resource_instance":
#          param => "'the value we are getting in this example''"
#      }
#
#      # Because of order of evaluation, a second definition is needed
#      # that will be evaluated after the first resource has been declared
#      #
#      define example_get_param {
#        # This will notice the value of the parameter
#        notice(getparam(Example_resource["example_resource_instance"], "param"))
#      }
#
#      # Declare an instance of the second resource type - this will call notice
#      example_get_param { 'show_notify': }
#
#    Would notice: 'the value we are getting in this example'
#
#    > **Note** that since Puppet 4.0.0 it is possible to get a parameter value by using its data type
#    and the [ ] operator. The example below is equivalent to a call to getparam():
#      ```Example_resource['example_resource_instance']['param']``
#
#
#
Puppet::Functions.create_function(:'stdlib::getparam') do
  # @param vals
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :vals
  end

  def default_impl(*vals)
    reference, param = vals
    raise(ArgumentError, 'Must specify a reference') unless reference
    raise(ArgumentError, 'Must specify name of a parameter') unless param && param.instance_of?(String)

    return '' if param.empty?

    resource = closure_scope.findresource(reference.to_s)
    if resource
      return resource[param] unless resource[param].nil?
    end

    ''
  end
end
