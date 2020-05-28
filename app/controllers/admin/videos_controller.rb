class Admin::VideosController < ApplicationController
  before_action :find_video, only: [:edit, :update, :destroy]
  before_action :video_params, only: [:create, :update]
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @videos = Video.order(updated_at: :desc)
    for i in 0... (@videos.length)
      video = @videos[i]
      query = URI(video.url).query
      if query.nil?
        path = URI(video.url).path
        video.url = path[1..path.length]
      else
        params = CGI::parse(query)
        video.url = params['v'][0]
      end
    end
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @video.update(video_params)
    redirect_to admin_videos_path
  end

  def destroy
    @video.destroy
    redirect_to admin_videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :url)
  end

  def find_video
    @video = Video.find(params[:id])
  end
end
