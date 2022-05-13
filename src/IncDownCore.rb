require_relative 'Plugin'
require 'commonmarker'
module IncDownCore
  # setup 
  $: << File.expand_path('../../plugins/', __FILE__)
  # Constants
 
  filepath = ARGV[0]
  content = File.read(filepath)
  destination = ARGV[1] ? ARGV[1] : File.join(File.dirname(filepath),File.basename(filepath,'.*')) 



  content, variables, plugins_to_load = IncDownCore::Plugin.parse_yaml(content)

  plugins_to_load.each do |plugin|
    IncDownCore::Plugin.load_plugin(plugin)
  end

  # IncDownCore::Plugin.load_plugins
  # p content
  content = IncDownCore::Plugin.run_plugins(content)
  


  html = CommonMarker.render_html(content, :DEFAULT)
  File.write((destination +'.html'), html)
 
end