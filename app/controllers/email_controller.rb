class EmailController < ApplicationController
  def new
    @badge = Badge.find(params[:id])
  end
  
  def send
    @badge = Badge.find(params[:id])
    BadgeMailer.badge_and_comment(@badge, params[:email], params[:message]).deliver
    flash[:success] = "Email has been sent to #{params[:email]}"
    redirect_to root_path
  end
end
