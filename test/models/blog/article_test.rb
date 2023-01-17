require "test_helper"

class Blog::ArticleTest < ActiveSupport::TestCase

  test "should not save article without title and body" do
    article = Blog::Article.new
    assert_not article.save, "Saved the article without a title and body"
  end

  test "should not saved article without body" do
    article = Blog::Article.new
    article.title = 'Title'
    assert_not article.save, "Saved the article without body"
  end

  test "should not saved article without title" do
    article = Blog::Article.new
    article.body = 'body'
    assert_not article.save, "Saved the article without title"
  end

  test "should not allow duplicate title" do
    Blog::Article.create(title: 'title', body: 'body')
    article_2 = Blog::Article.new(title: 'title', body: 'body')
    assert_not article_2.save, "Saved a duplicate article title"
  end

  test "should not allow title less then 5 length" do
    article = Blog::Article.new(title: 't2', body: 'body')
    assert_not article.save, "Saved a article with less then 5 length title"
  end

  test "should allow title with 5 length" do
    article = Blog::Article.new(title: 'title', body: 'body')
    assert article.save, "Not saved with 5 length title"
  end

  test "should be saved article when title and body present" do
    article = Blog::Article.new
    article.title = 'Title'
    article.body = 'body'
    assert article.save, "Article not saved though title and body are present"
  end

end
