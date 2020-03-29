require 'uri'
require 'cgi'

class VideosController < ApplicationController
  def index
    @videos = Video.order(updated_at: :desc)
    for i in 0... (@videos.length)
      video = @videos[i]
      query = URI(video.url).query
      params = CGI::parse(query)
      video.url = params['v'][0]
    end
  end
end
