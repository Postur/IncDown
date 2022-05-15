# frozen_string_literal: true

# some class
class Includer
  def initialize; end

  def run(content, in_file, _out_file)
    matches = content.match(/\n(\[includer\])\((.*)\)\n/m)
    return content if matches.nil?

    file_to_include = if matches[2].start_with?('./')

                        File.join(File.dirname(File.absolute_path(in_file)), matches[2].gsub('./', ''))

                      else

                        matches[2]

                      end
    included_content = IncDownCore.main(file_to_include, 'temp')
    p included_content
    content.gsub(/\n\[includer\]\(.*\)\n/m, included_content)
  end
end
ARGV[2].register(Includer)
