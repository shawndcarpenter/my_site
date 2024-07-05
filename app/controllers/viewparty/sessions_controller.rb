class Viewparty::SessionsController < ApplicationController
  def new
  end

  def create
    if Viewer.where(email: params[:email]) != []
      viewer = Viewer.where(email: params[:email]).first
      if viewer && viewer.authenticate(params[:password])
        session[:viewer_id] = viewer.id
        flash[:notice]="Login successful"
        redirect_to '/viewparty'
      else
        flash[:notice]="Invalid Email or Password"
        redirect_to '/viewparty/login'
      end
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/viewparty/login'
    end
  end

  def destroy
    session[:email] = nil
    flash[:notice]="Logged Out"
    redirect_to '/viewparty/login'
  end
end
