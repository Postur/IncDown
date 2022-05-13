class TOC
  def initialize()

    return self
  end
  def generate_toc(content) 
    doc = CommonMarker.render_doc(content)

    toc = ''

    doc.walk do |node|
      if node.type == :header
        node.each do |subnode|
          toc += "\n#{'  '*node.header_level} - [#{subnode.string_content}](#{subnode.string_content})" #"\n #{' '*node['header_level']} - #{node['children'][0]['string_content']}"
        end
      end
    end

    puts toc

    toc
  end
  def run(content)

    toc = generate_toc(content)

    content = content.gsub(/\n\[toc\]\n?/,toc)
    return content
  end
end
IncDownCore::Plugin.register(TOC)