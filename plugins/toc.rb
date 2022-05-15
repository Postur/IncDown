# frozen_string_literal: true

# Table of contents class
class TOC
  def initialize
    p 'initializing TOC plugin'
    p 'registering TOC plugin'
    # plugin_manager.register(TOC)
  end

  def generate_toc(content)
    toc = ''
    headerid = 1
    CommonMarker.render_doc(content).walk do |node|
      if node.type == :header
        node.each do |subnode|
          toc += "\n#{'  ' * node.header_level} - [#{subnode.string_content}](##{headerid})\n"
        end
        headerid += 1
      end
    end
    toc
  end

  def run(content, _infile, _out_file)
    toc = generate_toc(content)

    content.gsub(/\n\[toc\]\n?/, toc)
  end
end
ARGV[2].register(TOC)
