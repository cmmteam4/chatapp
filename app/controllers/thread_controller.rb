class ThreadController < ApplicationController
  def index
  end

  def create
      @thread = Thread.new(thread_body:params[:thread_body],message_id:params[:message_id])
      if @thread.save
        @channel=Channel.find(session[:curr_channel_id])
        @message = Message.find(params[:message_id])
        redirect_to channel_path(@channel)
      end
  end
end
