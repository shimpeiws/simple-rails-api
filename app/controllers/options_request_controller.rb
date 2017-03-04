class OptionsRequestController < ApplicationController
  ACCESS_CONTROL_ALLOW_METHODS = %w(GET OPTIONS).freeze
  ACCESS_CONTROL_ALLOW_HEADERS = %w(Accept Origin Content-Type Authorization).freeze
  ACCESS_CONTROL_MAX_AGE = 86_400

  def preflight
    # return render nothing: true, status: :not_found if request.headers['HTTP_ORIGIN'].blank?
    # return render nothing: true, status: :not_acceptable unless valid_request?

    set_preflight_headers!
    render nothing: true
  end

  private

  def valid_request?
    request_method = request.headers['Access-Control-Request-Method']
    request_headers = request.headers['Access-Control-Request-Headers'].to_s.split(/,\s*/)

    allow_headers = Regexp.new(Regexp.union(ACCESS_CONTROL_ALLOW_HEADERS).source, Regexp::IGNORECASE)

    request_method.in?(ACCESS_CONTROL_ALLOW_METHODS) && request_headers.present? &&
      request_headers.all? { |header| header.downcase =~ allow_headers }
  end

  def set_preflight_headers!
    response.headers['Access-Control-Max-Age'] = ACCESS_CONTROL_MAX_AGE
    response.headers['Access-Control-Allow-Headers'] = ACCESS_CONTROL_ALLOW_HEADERS.join(',')
    response.headers['Access-Control-Allow-Methods'] = ACCESS_CONTROL_ALLOW_METHODS.join(',')
  end
end
