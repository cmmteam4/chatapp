class MessagesController < ApplicationController
    def index
        @message =Message.all
    end

    def new
        @message=Message.new
    end
    
    def create
        @message = Message.new(msg_body:params[:msg_body],starred:0,unread:1,channel_id:params[:channel_id],user_id: current_user.id)
        @channel=Channel.find(session[:curr_channel_id] )         
            respond_to do |format|
                if @message.save                 
                    format.html { redirect_to @message, notice: 'User was successfully created.' }
                    format.js
                    format.json { render json: @message, status: :created, location: @message }
                
                else
                    format.html { render action: "new" }
                    format.json { render json: @message.errors, status: :unprocessable_entity }
                end
            end
    end
    
    def destroy
        Message.destroy(params[:id])
        @channel=Channel.find(session[:curr_channel_id] )
        redirect_to channel_path(@channel)
    end
    
end
