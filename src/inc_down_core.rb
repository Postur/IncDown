# frozen_string_literal: true

require_relative 'Plugin'
require 'commonmarker'
# Top level module
module IncDownCore
  # setup
  $LOAD_PATH << File.expand_path('../plugins', __dir__)

  def self.main(in_file, out_file)
    out_file = out_file.nil? ? "#{File.join(File.dirname(in_file), File.basename(in_file, '.*'))}.html" : out_file

    puts "Input file: #{in_file}"
    puts "Output File: #{out_file}"

    file_contents = File.read(in_file)

    content, plugins_to_load = IncDownCore::Plugin.parse_yaml(file_contents)

    p 'will try to load plugins:'

    plugins_to_load.each do |plugin|
      p plugin[0]
    end

    plugin_runner = IncDownCore::Plugin.new(plugins_to_load)

    p plugin_runner.plugins

    p content = plugin_runner.run_plugins(content)
  end

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
  # Constants

  INC_DOWN_CORE_PATH = __FILE__

  # FILEPATH = ARGV[0] # Absoloute or relative path to .md file

  # DESTINATION = if ARGV[1] # Absoloute or relative path to .html out file
  #                 "#{ARGV[1]}.html"
  #               else
  #                 "#{File.join(File.dirname(FILEPATH),
  #                              File.basename(FILEPATH, '.*'))}.html"
  #               end

  # content = File.read(FILEPATH)
  # content, _variables, plugins_to_load = IncDownCore::Plugin.parse_yaml(content)

  # unless plugins_to_load.nil?
  #   plugins_to_load.each do |plugin|
  #     IncDownCore::Plugin.load_plugin(plugin)
  #   end
  # end
  # content = IncDownCore::Plugin.run_plugins(content)

  # # html = CommonMarker.render_html(content)
  # RENDERER = IncHtmlRenderer.new

  # html = RENDERER.render(CommonMarker.render_doc(content, :UNSAFE))

  # File.write(DESTINATION, html)
  # p 'this is the output' if ARGV[2]
  main(ARGV[0], ARGV[1])
end
