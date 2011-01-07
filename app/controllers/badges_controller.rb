class BadgesController < ApplicationController
  def index
    per_page = 10

    @page = params[:page].to_i
    @page = (@page > 1) ? @page : 1
    
    @badges = Badge.limit(per_page).offset((@page - 1) * per_page)
    @total_pages = (Badge.count.to_f/per_page).ceil
    
    @badge_dummy = Badge.new
  end
  
  def create
    @badge = Badge.new(params[:badge])
    if @badge.save
      flash[:success] = "Your badge is home"
      redirect_to badges_path
    else
      flash[:error] = "Stuff was wrong in your badge stuff"
      render :action => "new"
    end
  end
  
  def new
    @badge = Badge.new
    session[:return_to] = request.referer || nil
  end
  
  def edit
    @badge = Badge.find(params[:id])
  end
  
  def update
    @badge = Badge.find(params[:id])
    if @badge.update_attributes(params[:badge])
      flash[:success] = "Badge updated"
      redirect_to badges_path
    else
      flash[:error] = "Whoops, looks like something was wrong with that badge..."
      render :action => "edit"
    end
  end
  
  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    flash[:success] = "Badge be gone!"
    redirect_to badges_path
  end
end
