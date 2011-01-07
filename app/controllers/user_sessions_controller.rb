class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Logged in"
      redirect_back_or_default root_path
    else
      flash[:error] = "Something was wrong with your login info"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Logged out"
    redirect_back_or_default root_path
  end
end
