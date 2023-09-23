class Admin::DashboardController < ApplicationController
  before_action :http_basic_authenticate

  def show
  end

  private

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USERNAME'] && BCrypt::Password.new(ENV['BASIC_AUTH_PASSWORD_HASH']) == password #Authentication from env
    end
  end
end
