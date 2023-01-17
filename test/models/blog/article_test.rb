require "test_helper"

class Blog::ArticleTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Blog::Article.new
    assert_not article.save, "Saved the article without a title"
  end

end
