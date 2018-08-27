class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  # Authenticate the tenant with token based authentication
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_tenant = Tenant.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render status: :unauthorized
  end
end
