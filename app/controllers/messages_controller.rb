class MessagesController < ApplicationController
    def index
        logger.info "-----index ------"
        @message =Message.all
    end

    def new
        logger.info "-----New------"
        @message=Message.new
    end
    
    def create
        logger.info "-----Create #{params[:id]}------"
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
        logger.info "-----Destroy #{params[:id]}------"
        Message.destroy(params[:id])
        @channel=Channel.find(session[:curr_channel_id] )
        redirect_to channel_path(@channel)
    end  
    
    def star
        message = Message.find(params[:star_id])
        if message.starred == false or message.starred.nil?
              message.starred = "true"
            else
                message.starred = "false"
            end
        message.save     
        redirect_back(fallback_location: root_path)
    end
end
