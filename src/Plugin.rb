require('yaml')

module IncDownCore
module Plugin
  def self.parse_yaml(content)

    front_matter =  YAML.load(content)
  
    variables = front_matter['variables']
    plugins = front_matter["plugins"]

    content = content.gsub(/\A---.*?---/m,'')
    return content, variables, plugins
  end
  def self.hello
    'hello'
  end
  @@plugins = []
  def self.plugins
    return @@plugins
  end
  def self.load_plugins()
    Dir["plugins/*.rb"].each do |path|
      load_plugin(path)
    end
    puts @@plugins
  end
  def self.load_plugin(plugin)

    load(plugin)
    
    # IncDownCore::Plugin.plugins.push(plugin)
  end
  def self.register(mod)
    @@plugins.push(mod.new)
  end
  def self.run_plugins(content)
    @@plugins.each do |plugin|
      content = plugin.run(content)
    end
    content
  end

end
end