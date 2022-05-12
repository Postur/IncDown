require_relative 'Plugin'

module IncDownCore
  filepath = ARGV[0]

  content = File.read(filepath)

  content, variables, plugins = IncDownCore::Plugin.parse_yaml(content)

  p variables
  plugins.each do |plugin|
    p plugin
  end

  IncDownCore::Plugin.load_plugins
  p content
  content = IncDownCore::Plugin.run_plugins(content)
  File.write((filepath+'.html'),content)
 
end