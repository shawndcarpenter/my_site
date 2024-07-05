class Thirdspace::Admin::DashboardController < ApplicationController

  def index
    @users = User.all
    @user = current_admin_user
    @contacts = Contact.all
  end
end