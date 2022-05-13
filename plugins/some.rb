# frozen_string_literal: true

# some class
class Some
  def initialize
    self
  end

  def run(content)
    content += 'Some Plugin ran'
    content
  end
end
IncDownCore::Plugin.register(Some)
