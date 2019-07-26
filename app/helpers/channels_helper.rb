module ChannelsHelper
    def set_channel(channel)
        session[:curr_channel_id] = channel.id
    end
    
    def get_channel
        Channel.find(session[:curr_channel_id])
    end
end
