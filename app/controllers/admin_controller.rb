class AdminController < ApplicationController
  before_filter :check_admin
  
  def home
    @users = User.all
  end
  
  def edit
    @application_form = ApplicationForm.find(params[:id])
  end
  
  private
    def check_admin
      redirect_to root_path unless current_user.admin?
    end
  
end