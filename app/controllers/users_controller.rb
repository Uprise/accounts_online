class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @application_forms = ApplicationForm.all if current_user.admin?
  end
end