
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



# IncDown
IncDown is a system for writing documents in a markdown like syntax, that is easily customizable and expandable.

# Goal

The goal is to make a parser system for writing documents.

I like markdown for writing documents, but sometimes I need a bit more.

The problem;
I use alot of different software for calculating and genereating data. I need a system for writing where; when I update input data of my software, it is reflected in my document without me having to copy/paste for example a chart, that may or may not look different depending on what software the data/chart came from.
what I want is


```plain
this is some plain code block
some more code

```


```plain
  ---
  package: 'Sketchup' <-- a collection of plugins for Sketchup data.
  import: 'program_name_chart' <-- this is a plugin.
  import: 'some_other_program_chart' <-- this is another plugin, order is important.
  import: 'Base64Image' <-- this plugin will render all images to base64 encoded data images   in the reulting HTML.
  ---
  
  # Heading1
  
  ## Heading2
  
  [program_name_chart](Path/to/data, image_name) <-- will render a chart and save the   resulting image to a relative path e.g. ./images/program_name_chart/image_name.png
```

The imported plugins are user created or downloaded from a repository.

Anything within [] is a function call, anything inside the proceeding () is the functions arguments, the functions could return anything.

IncDown core should have as few functions as possible, and mostly adhear to the CommonMark spec.



# Features

  - import plugins to change the parser.


## Core design

first Yaml gets striped and parsed.


The CommonMark renderer gets called last

# Documentation
```powershell

yardoc

yard server

```