# concept 

 YARD also supports an optional "types" declarations for certain tags. This
allows the developer to document type signatures for ruby methods and parameters
in a non intrusive but helpful and consistent manner. Instead of describing this
data in the body of the description, a developer may formally declare the
parameter or return type(s) in a single line. Consider the following method
documented with YARD formatting:

```ruby
# Reverses the contents of a String or IO object.
#
# @param contents [String, #read] the contents to reverse
# @return [String] the contents reversed lexically
def reverse(contents)
  contents = contents.read if contents.respond_to? :read
  contents.reverse
end
```

With the above @param tag, we learn that the contents parameter can either be a
String or any object that responds to the 'read' method, which is more powerful
than the textual description, which says it should be an IO object. This also
informs the developer that they should expect to receive a String object
returned by the method, and although this may be obvious for a 'reverse' method,
it becomes very useful when the method name may not be as descriptive.