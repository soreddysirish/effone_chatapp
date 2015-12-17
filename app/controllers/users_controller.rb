class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:update, :destroy, :edit, :show, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #around_filter :update_user_status, only: [:join_to_chat]
  #before_action :load_company, only: :create

  load_and_authorize_resource except: [:create]
  # GET /users
  # GET /users.json
  def index
     @users = User.all
    if current_user.present?
      current_user.update_attributes(status: true)
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render "new"
    end

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    @user=User.find(params[:id])
    if @user.update_attributes(banned:params[:banned])
      flash[:notice]=" user is successfully banned"
      # if current_user.present? && current_user.banned?
      #   current_user sign_out
      #   redirect_to root_url
      # end
      render nothing:true
    end
  end

  private
  def update_user_status
    if session[:current_user]= nil?
      current_user.update_attributes(status: false)
    end
 end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def load_company
    @user = User.new(user_params)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :user_name,:current_sign_in_at)
    end
end
