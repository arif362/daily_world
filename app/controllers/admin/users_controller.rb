class Admin::UsersController < ApplicationController
  layout 'admin/admins'
  before_action :authenticate_user!, :authenticate_admin!
  before_action :authenticate_user!

  def index
    @users = User.includes(:profile_photo_attachment).order(id: :desc)
  end
end