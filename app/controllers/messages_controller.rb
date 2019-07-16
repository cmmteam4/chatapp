class MessagesController < ApplicationController
    def index
        @message =Message.all
    end
    def new
        @message=Message.new
    end
    
    def create
        @message = Message.new(msg_body:params[:msg_body],starred:0,unread:1,channel_id:params[:channel_id],user_id: current_user.id)
         if @message.save
         @channel=Channel.find(session[:curr_channel_id] )
         redirect_to channel_path(@channel)
        end
    end
end
