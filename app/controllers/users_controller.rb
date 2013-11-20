class UsersController < ApplicationController
  before_action :check_if_user_login, :except => [:new, :create]    
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  include LoginHelper

  # GET /users
  # GET /users.json
  def index
    respond_to do |format| # <- 这里
      @users = User.all
      format.html {  }
      format.js
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    flash.clear
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
      if params[:islogin]
        login_user @user
      end
      flash['success'] = '用户注册成功！'
      redirect_to @user
    else
      flash.now['danger'] = '用户注册失败！' + @user.errors.full_messages.join(', ')
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.   
    def user_params    
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end