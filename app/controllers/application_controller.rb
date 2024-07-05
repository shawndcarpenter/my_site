class ApplicationController < ActionController::Base
  def current_viewer
    if Viewer.all == []
      redirect_to viewparty_register_path
    else
      @current_user ||= Viewer.find(session[:viewer_id]) if session[:viewer_id]
    end
  end

  def current_user
    @current_user = User.first
  end
  helper_method :current_viewer
  helper_method :current_user


  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
