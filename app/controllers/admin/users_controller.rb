class Admin::UsersController < ApplicationController
  layout 'admin/admins'
  
  before_action :authenticate_user!

  def index
  end
end