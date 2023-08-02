class Blog::ArticlesController < ApplicationController
  # require "prawn"
  before_action :get_article, only: [:show, :download_pdf, :view_pdf]

  def index
    @articles = Blog::Article.includes(:author, :comments).order(created_at: :desc).paginate(page: params[:page], per_page: 30)
  end

  def new
    @article = Blog::Article.new
  end

  def create
    @article = Blog::Article.new(article_params)
    @article.author_id = Blog::Author.last.id
    if @article.save!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def download_pdf
    send_data generate_pdf(@article),
              filename: "#{@article.title}.pdf",
              type: "application/pdf"
  end

  def view_pdf
    render xml: @article
  end

  private

  def article_params
    params.require(:blog_article).permit(:title, :body, :image)
  end

  def get_article
    @article = Blog::Article.find_by(id: params[:id])
    redirect_back_or_to '/' unless @article.present?
  end

  def generate_pdf(article)
    Prawn::Document.new do
      text article.title, align: :center
      text "Description: #{article.body}"
    end.render
  end

end
