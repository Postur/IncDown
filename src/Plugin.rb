

module IncDownCore
module Plugin
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