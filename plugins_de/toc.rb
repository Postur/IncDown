class TOC
  def initialize()

    return self
  end
  def run(content)
    content += "TOC Plugin ran"
    return content
  end
end
IncDownCore::Plugin.register(TOC)