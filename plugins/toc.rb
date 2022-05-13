class TOC
  def initialize()

    return self
  end
  def generate_toc(content) 
    doc = CommonMarker.render_doc(content)

    toc = ''
    p IncDownCore::Destination
    doc.walk do |node|
      if node.type == :header
        node.each do |subnode|
          toc += "\n#{'  '*node.header_level} - [#{subnode.string_content}](##{subnode.string_content.gsub(' ','_')})"
        end
      end
    end



    toc
  end
  def run(content)

    toc = generate_toc(content)

    content = content.gsub(/\n\[toc\]\n?/,toc)
    return content
  end
end
IncDownCore::Plugin.register(TOC)