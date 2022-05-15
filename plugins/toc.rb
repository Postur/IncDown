# frozen_string_literal: true

# Table of contents class
class TOC
  def initialize; end

  def generate_toc(content)
    toc = ''
    headerid = 1
    CommonMarker.render_doc(content).walk do |node|
      if node.type == :header
        node.each do |subnode|
          toc += "\n#{'  ' * node.header_level} - [#{subnode.string_content}](##{headerid})"
        end
        headerid += 1
      end
    end
    toc
  end

  def run(content)
    toc = generate_toc(content)

    content.gsub(/\n\[toc\]\n?/, toc)
  end
end
IncDownCore::Plugin.register(TOC)
