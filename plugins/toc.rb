class TOC
  def initialize()

    return self
  end
  def run(content)
    content += "\n TOC Plugin ran \n"
    return content
  end
end
IncDownCore::Plugin.register(TOC)