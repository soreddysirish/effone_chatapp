class MessagesController < ApplicationController
   def index
      @messages=Message.all
      if user_signed_in?
        current_user.update_attributes(status:true)
        @details=User.where(:user_name => current_user.user_name)
        @online=User.online_users_list-[current_user]
        @message=Message.new
      end
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
