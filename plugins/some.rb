class Some
  def initialize()

    return self
  end
  def run(content)
    content += "\n Some Plugin ran \n"
    return content
  end
end
IncDownCore::Plugin.register(Some)