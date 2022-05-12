require 'commonmarker'
class CommonMark
  def initialize()
    return self
  end
  def run(content)
    content = CommonMarker.render_html(content, :DEFAULT)
    return content
  end
end
IncDownCore::Plugin.register(CommonMark)