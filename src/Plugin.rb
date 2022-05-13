require('yaml')

module IncDownCore
module Plugin
  @@plugins_path = '../plugins/'
  def self.parse_yaml(content)

    front_matter =  YAML.load(content)
  
    variables = front_matter['variables']
    plugins = front_matter["plugins"]

    content = content.gsub(/\A---.*?---/m,'')
    return content, variables, plugins
  end
  @@plugins = []
  def self.plugins
    return @@plugins
  end
  def self.load_plugin(plugin_to_load)
    plugin = {}
    plugin[:name] = plugin_to_load[0]
    plugin[:arguments] = plugin_to_load[1]

    load(plugin[:name]+'.rb')
    
    # IncDownCore::Plugin.plugins.push(plugin)
  end
  def self.register(class_to_register)
    @@plugins.push(class_to_register.new)
  end
  def self.run_plugins(content)
    @@plugins.each do |plugin|
      content = plugin.run(content)
    end
    content
  end

end
end