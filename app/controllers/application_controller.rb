require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  around_action :logging_traffic

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  def logging_traffic
    puts "USERAGENT: #{request.original_url}, #{request.method}"
    begin
      yield
    ensure
      puts "response_status: #{response.status}"
    end
  end
end
