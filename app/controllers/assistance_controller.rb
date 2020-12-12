class AssistanceController < ApplicationController
  def index
    @assistance = Assistance.new(params[:assistance])
  end

  def create
    @assistance = Assistance.new(params[:assistance])

    @assistance.request = request
    respond_to do |format|
      if @assistance.deliver
        # re-initialize Home object for cleared form
        @assistance = Assistance.new
        format.html { render 'index' }
        format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = 'Message did not send.' }
      end
    end
  end
end
