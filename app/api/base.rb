class Base < Grape::API
  prefix 'api'
  mount User

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    rack_response({
                    status: e.status,
                    error_msg: e.message,
                  }.to_json, 400)
  end
end