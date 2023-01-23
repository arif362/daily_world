class Blog::ArticlesController < ApplicationController
  # require "prawn"
  before_action :get_article, only: [:show, :download_pdf, :view_pdf]

  def index
    flash[:notice] = "You have successfully logged out."
    @articles = Blog::Article.all
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
