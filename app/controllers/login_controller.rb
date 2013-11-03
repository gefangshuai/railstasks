class LoginController < ApplicationController
  before_action :check_if_user_login, :only => :destroy

  include LoginHelper

  def new
    flash.clear
  end

  def create
    user = User.find_by(:username => params[:login][:username] )
    if user && user.authenticate(params[:login][:password])
      login_user user
      flash[:success] = '登录成功，欢迎回来！'
      redirect_to root_path
    else
      flash[:danger] = '登录失败，请确认输入的用户名或密码是否正确！'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = '退出成功！'
    redirect_to signin_path
  end

  private

  

end
