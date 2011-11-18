class ApplicationController < ActionController::Base
  protect_from_forgery
  # Not using this, since flash (used by uploadify) can't deal with basic authentication. F**ink Adobe.
  # http_basic_authenticate_with :name => "upload", :password => "secret"
end
