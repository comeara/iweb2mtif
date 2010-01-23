require "nokogiri"
require "parsedate"

class IWebArticle
  def self.build(opts)
    new Nokogiri::XML(opts[:source])
  end
  
  def initialize(doc)
    @doc = doc
  end
  
  def [](key)
    method_name = key.to_sym
    return nil unless respond_to?(method_name)
    send method_name
  end
  
  def body
    @doc.css("#generic-body-attributes richText").text
  end
  
  def category
    "Articles"
  end
  
  def date
    year, month, day, not_needed = ParseDate.parsedate @doc.css("#generic-datefield-attributes richText").text
    Date.new year, month, day
  end
  
  def title
    @doc.css("#generic-title-attributes richText").text
  end
  
  def published?
    true
  end
end