class RoomMessagesController < ApplicationController
    before_action :load_entities
    protect_from_forgery with: :exception



    def create
      @room_message = RoomMessage.create user: current_user,
                                         room: @room,
                                         message: params.dig(:room_message, :message)


     RoomChannel.broadcast_to @room, @room_message
    end

    def index
      if params[:room_id].present?
        @room = Room.find_by(id: params[:room_id])
        if @room.present?
          @room_messages = @room_messages
        else
          flash[:alert] = "Room not found"
          redirect_to root_path
        end
      else
        flash[:alert] = "Room ID is required"
        redirect_to root_path
      end
    end
   
    protected
  
   
    def load_entities
      @room = Room.find params.dig(:room_message, :room_id)
    end

  
    
  end