class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id])
    @application_forms = ApplicationForm.all if current_user.admin?
  end
end