# frozen_string_literal: true

require_relative 'Plugin'
require 'commonmarker'
# Top level module
module IncDownCore
  class IncHtmlRenderer < CommonMarker::HtmlRenderer
    def initialize
      super
      @headerid = 1
    end

    def header(node)
      block do
        out('<h', node.header_level, ' id="', @headerid, '">',
            :children, '</h', node.header_level, '>')
        @headerid += 1
      end
    end

    def html(node)
      block do
        out(node.string_content)
      end
    end
  end
  # setup
  $LOAD_PATH << File.expand_path('../plugins', __dir__)
  # Constants

  INC_DOWN_CORE_PATH = __FILE__

  FILEPATH = ARGV[0] # Absoloute or relative path to .md file

  DESTINATION = if ARGV[1] # Absoloute or relative path to .html out file
                  "#{ARGV[1]}.html"
                else
                  "#{File.join(File.dirname(FILEPATH),
                               File.basename(FILEPATH, '.*'))}.html"
                end

  content = File.read(FILEPATH)
  content, _variables, plugins_to_load = IncDownCore::Plugin.parse_yaml(content)

  unless plugins_to_load.nil?
    plugins_to_load.each do |plugin|
      IncDownCore::Plugin.load_plugin(plugin)
    end
  end
  content = IncDownCore::Plugin.run_plugins(content)

  # html = CommonMarker.render_html(content)
  RENDERER = IncHtmlRenderer.new

  html = RENDERER.render(CommonMarker.render_doc(content, :UNSAFE))

  File.write(DESTINATION, html)
  p html
end
