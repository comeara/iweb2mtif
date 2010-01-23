require "erb"

class MovableTypePost
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end
  
  def render
    template_path = File.expand_path(File.dirname(__FILE__)) + "/templates/movable_type_post.erb"
    erb = ERB.new File.read(template_path)
    erb.result binding
  end
end