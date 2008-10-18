class ApplicationController < ActionController::Base
  helper :all

private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      Digest::MD5.hexdigest("asd-rb-#{username}") == USERNAME_HASH &&
        Digest::MD5.hexdigest("asd-rb-#{password}") == PASSWORD_HASH
    end
  end
end
