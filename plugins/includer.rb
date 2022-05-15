# frozen_string_literal: true

# some class
class Includer
  def initialize(plugin_manager)
    plugin_manager.register(Includer)
  end

  def run(content)
    matches = content.match(/\n(\[includer\])\((.*)\)\n/m)

    file_to_include = if matches[2].start_with?('./')

                        File.join(File.dirname(File.absolute_path(IncDownCore::FILEPATH)), matches[2].gsub('./', ''))

                      else

                        matches[2]

                      end
    included_content = `ruby #{IncDownCore::INC_DOWN_CORE_PATH} #{file_to_include} temp something`
    p included_content
    content.gsub(/\n\[includer\]\(.*\)\n/m, included_content)
  end
end
