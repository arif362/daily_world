class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin!

  def dashboard

  end
  def index
  end
end
