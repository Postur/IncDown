require_relative 'Plugin'

module IncDownCore
  include(Plugin)
  

  IncDownCore::Plugin.load_plugins

  content = IncDownCore::Plugin.run_plugins('This is the markdown file contents ')
  p content
  
end