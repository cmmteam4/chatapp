class MessagesController < ApplicationController
    def index
        @message =Message.all
    end

    def new
        @message=Message.new
    end
    
    def create
        @message = Message.new(msg_body:params[:msg_body],starred:0,unread:1,channel_id:params[:channel_id],user_id: 1)
         if @message.save
         @channel=Channel.find(session[:curr_channel_id] )
         redirect_to channel_path(@channel)
        end
    end
    
    def destroy
        Message.destroy(params[:id])
        @channel=Channel.find(session[:curr_channel_id] )
        redirect_to channel_path(@channel)
    end
    
end
