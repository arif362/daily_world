class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Blog::Article.all
    render json: articles, status: :ok
  end

  def show
  end
end
