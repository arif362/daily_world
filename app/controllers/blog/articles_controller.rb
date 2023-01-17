class Blog::ArticlesController < ApplicationController
  before_action :get_article, only: [:show]

  def index
    @articles = Blog::Article.all
  end

  private

  def get_article
    @article = Blog::Article.find_by(id: params[:id])
    redirect_back_or_to '/' unless @article.present?
  end

end
