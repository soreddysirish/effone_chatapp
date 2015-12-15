class MessagesController < ApplicationController
   def index
    @messages=Message.all
     @online=User.online_users_list
     @message=Message.new
   end

  def new
    @message=Message.new
  end

  def create
    @message=Message.create(message_params)
    @messages=Message.all
      respond_to do |format|
      format.js
    end
  end

  def show
    @message=Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id:current_user.id)
  end
end
