class ApplicationController < ActionController::Base
  include Authentication
  # http_basic_authenticate_with name: "arif", password: "123456"
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
