class ApplicationFormsController < ApplicationController
  before_filter :correct_user, :only => [:edit, :update, :show]
  
  def new
    @application_form = ApplicationForm.new
    @application_form.bank_accounts.build
  end
  
  def create
    @application_form = ApplicationForm.new(params[:application_form])
    @application_form.user = current_user
    if @application_form.save
      session[:application_form] = @application_form.id
      redirect_to second_step_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @application_form.update_attributes(params[:application_form])
      if current_user.admin?
        redirect_to admin_path
      else
        redirect_to second_step_path
      end
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def show
    @ba1 = @application_form.bank_accounts[0] ? @application_form.bank_accounts[0] : BankAccount.new
    @ba2 = @application_form.bank_accounts[1] ? @application_form.bank_accounts[1] : BankAccount.new
    @ba3 = @application_form.bank_accounts[2] ? @application_form.bank_accounts[2] : BankAccount.new
    respond_to do |format|
      format.html do
        render :layout => "pdf"
      end
      format.pdf do
        render :pdf => "show", :layout => "pdf"
      end
    end
  end
  
  def optional_info
    @application_form = current_user.application_form
  end
  
  def download
    @application_form = current_user.application_form
    redirect_to second_step_path if params[:bank_account][:pays_subscription].blank?
    @application_form.bank_accounts.each {|a| a.update_attribute :pays_subscription, false}
    pays_subcription = params[:bank_account][:pays_subscription]
    unless pays_subcription == 'bartercard'
      @subscription_account = BankAccount.find(params[:bank_account][:pays_subscription])
      redirect_to second_step_path if @subscription_account.application_form != current_user.application_form
      @subscription_account.update_attribute :pays_subscription, true
    end
    # redirect_to application_form_path(:id => @application_form.id)
  end
  
  def update_notes
    @application_form = ApplicationForm.find(params[:id])
    unless @application_form.update_attributes(params[:application_form])
      raise "Unable to update notes"
    end
    # redirect_to admin_home_path
    render :nothing => true
  end
  
  def update_status
    @application_form = ApplicationForm.find(params[:id])
    unless @application_form.update_attributes(params[:application_form])
      raise "Unable to update notes"
    end
    # redirect_to admin_home_path
    render :nothing => true
  end
  
  private
    def correct_user
      @application_form = ApplicationForm.find(params[:id])
      return if current_user == User.first || current_user == User.last
      redirect_to root_path unless current_user == @application_form.user
    end
end