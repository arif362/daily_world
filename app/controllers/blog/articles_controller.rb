class Blog::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  before_action :get_article, only: [:show, :download_pdf, :view_pdf]

  def index
    @articles = Blog::Article.includes(:comments, author: :profile_photo_attachment).order(created_at: :desc).paginate(page: params[:page], per_page: 50)
  end

  def new
    @article = Blog::Article.new
  end

  def create
    current_user.update_columns(type: 'Blog::Author')
    @article = current_user.articles.new(article_params)
    @article.notifications.build(notifiable: current_user, body: 'Article created successfully')
      if @article.save!
      redirect_to root_path, notice: 'Post created successfully!'
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
