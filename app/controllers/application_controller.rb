class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include Knock::Authenticable

  before_action :validate_http_origin

  private

  def validate_http_origin
    request_origin = request.headers['HTTP_ORIGIN']
    return if request_origin.blank?

    if request_origin == 'http://localhost:3355'
      response.headers['Access-Control-Allow-Origin'] = request_origin
    else
      render nothing: true, status: :not_acceptable
    end
  end
end
