require_relative 'Plugin'

module IncDownCore

  
  
  IncDownCore::Plugin.load_plugins
  
  content = IncDownCore::Plugin.run_plugins(ARGV[0])
  p content
 
end