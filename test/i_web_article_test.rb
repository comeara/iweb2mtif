$:.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")
require "rubygems"
require "i_web_article"

require "test/unit"
require "shoulda"

class IWebArticleTest < Test::Unit::TestCase
  context IWebArticle do
    context "build" do
      should "return an IWebArticle" do
        assert IWebArticle.build(:source => StringIO.new).is_a?(IWebArticle)
      end
    end
    
    context "sample" do
      setup do
        @article = IWebArticle.build(:source => File.read(File.dirname(__FILE__) + "/article.xml"))
      end
      
      context "title" do
        should "be Wrightsville Beach" do
          assert_equal "Wrightsville Beach", @article.title
        end
      end

      context "date" do
        should "be October 12, 2007" do
          assert_equal Date.new(2007, 10, 12), @article.date
        end
      end
    end
  end
end
