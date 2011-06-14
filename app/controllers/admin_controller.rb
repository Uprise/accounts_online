class AdminController < ApplicationController
  def home
    @users = User.all
  end
  
  def edit
    @application_form = ApplicationForm.find(params[:id])
  end
  
end