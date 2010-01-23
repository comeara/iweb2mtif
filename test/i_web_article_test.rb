require File.expand_path(File.dirname(__FILE__) + "/test_helper")
require "i_web_article"

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
      
      context "[]" do
        should "invoke the method with the same name as the key parameter" do
          assert_equal "Wrightsville Beach", @article[:title]
        end
        
        should "return nil if there is no method with the same name as the key parameter" do
          assert @article[:secret].nil?
        end
      end

      context "date" do
        should "be October 12, 2007" do
          assert_equal Date.new(2007, 10, 12), @article.date
        end
      end

      context "title" do
        should "be Wrightsville Beach" do
          assert_equal "Wrightsville Beach", @article.title
        end
      end

      context "published?" do
        should "return true" do
          assert @article.published?
        end
      end
      
      context "category" do
        should "be articles" do
          assert_equal "Articles", @article.category
        end
      end
      
      context "body" do
        should "contain a few key words" do
          assert_match /finding fish in the surf/, @article.body
        end
      end
    end
  end
end
