# frozen_string_literal: true

require_relative 'Plugin'
require 'commonmarker'
# Top level module
module IncDownCore
  # setup
  $LOAD_PATH << File.expand_path('../plugins', __dir__)
  # Constants

  FILEPATH = ARGV[0]
  content = File.read(FILEPATH)
  DESTINATION = if ARGV[1]
                  "#{ARGV[1]}.html"
                else
                  "#{File.join(File.dirname(FILEPATH),
                               File.basename(FILEPATH, '.*'))}.html"
                end

  content, _variables, plugins_to_load = IncDownCore::Plugin.parse_yaml(content)

  plugins_to_load.each do |plugin|
    IncDownCore::Plugin.load_plugin(plugin)
  end

  # IncDownCore::Plugin.load_plugins
  # p content
  content = IncDownCore::Plugin.run_plugins(content)

  html = CommonMarker.render_html(content)

  File.write(DESTINATION, html)
end