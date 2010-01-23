require File.expand_path(File.dirname(__FILE__) + "/test_helper")
require "movable_type_post"

class MovableTypePostTest < Test::Unit::TestCase
  context MovableTypePost do
    context "render" do
      setup do
        @post = MovableTypePost.new :date => Date.new(2010, 1, 22),
                                    :title => "My Great Post",
                                    :published? => true,
                                    :category => "Free Money",
                                    :body => "You too can have free money. Just send $19.95 for this money tree seed."
      end
      should "match the sample exactly" do
        assert_equal File.read(File.dirname(__FILE__) + "/samples/movable_type_post.txt"), @post.render
      end
    end
  end
end