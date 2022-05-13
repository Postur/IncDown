class Some
  def initialize()

    return self
  end
  def run(content)
    content += "Some Plugin ran"
    return content
  end
end
IncDownCore::Plugin.register(Some)