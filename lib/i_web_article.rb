require "nokogiri"
require "parsedate"

class IWebArticle
  def self.build(opts)
    new Nokogiri::XML(opts[:source])
  end
  
  def initialize(doc)
    @doc = doc
  end
  
  def date
    year, month, day, not_needed = ParseDate.parsedate @doc.css("#generic-datefield-attributes richText").text
    Date.new year, month, day
  end
  
  def title
    @doc.css("#generic-title-attributes richText").text
  end
end