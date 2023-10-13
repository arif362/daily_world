class Admin::ArticlesController < ApplicationController
  layout 'admin/admins'
  before_action :authenticate_user!, :authenticate_admin!
  before_action :authenticate_user!

  def index
    @articles = Blog::Article.includes(author: :user).paginate(page: params[:page]).order(id: :desc)
  end

  def show
    @article = Blog::Article.find(params[:id])
  end

end
