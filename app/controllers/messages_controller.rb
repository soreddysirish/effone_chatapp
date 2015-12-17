class MessagesController < ApplicationController
  before_action :authenticate_user!
   def index
     current_user.update_attributes(status:true)
      @messages=Message.all
      @message=Message.new
      @online=User.online_users_list-[current_user]
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
