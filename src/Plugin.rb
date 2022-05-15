# frozen_string_literal: true

require('yaml')

module IncDownCore
  # Plugin class
  class Plugin
    attr_reader :plugins

    def initialize(plugins)
      @plugins = []
      p 'Loading plugins...'
      plugins.each do |plugin|
        p "loading plugin: #{plugin}"
        load_plugin(plugin)
      end
    end

    @plugins_path = '../plugins/'
    def self.parse_yaml(content)
      front_matter = YAML.safe_load(content)

      plugins = front_matter['plugins']

      content = content.gsub(/\A---.*?---/m, '')
      [content, plugins]
    end

    def load_plugin(plugin_to_load)
      plugin = {}
      plugin[:name] = plugin_to_load[0]
      plugin[:arguments] = plugin_to_load[1]

      p plugin
      ARGV[3] = self
      load("#{plugin[:name]}.rb")

      # @plugins.push(plugin)
    end

    def register(class_to_register)
      p "registering #{class_to_register}"
      @plugins.push(class_to_register.new(self))
    end

    def run_plugins(content)
      @plugins.each do |plugin|
        content = plugin.run(content)
      end
      content
    end
  end
end
