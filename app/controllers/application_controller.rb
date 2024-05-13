# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: ENV['API_USER'] || 'Shout', password: ENV['API_PASSWORD'] || 'SuperSecret'
end
