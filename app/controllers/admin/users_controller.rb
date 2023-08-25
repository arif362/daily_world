class Admin::UsersController < ApplicationController
  layout 'admin/admins'
  before_action :authenticate_user!, :authenticate_admin!
  before_action :authenticate_user!

  def index
  end
end