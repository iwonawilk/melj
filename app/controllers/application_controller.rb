class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end
end
