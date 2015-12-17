class IndividualchatsController < ApplicationController

  def index
    @chat=Individualchat.new
    @chats=Individualchat.all
  
  end

  def new


  end

  def create

  end

  def edit

  end

end
