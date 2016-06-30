# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```
require 'byebug'
def transmogrify(string, options = {})
  tmy_string = ""
  defaults = {
    times: 5,
    upcase: false,
    reverse: false
  }
  options = defaults.merge(options)
  options[:times].times do
    if options[:upcase]
      if options[:reverse]
        tmy_string += string.upcase.reverse
      else
        tmy_string += string.upcase
      end
    elsif options[:reverse]
      tmy_string += string.reverse
    else
      tmy_string += string
    end
  end
  tmy_string
end
