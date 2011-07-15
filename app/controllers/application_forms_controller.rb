class ApplicationFormsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:edit, :update, :show, :view]
  
  def new
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.build
    @application_form.bank_accounts.build(:number_of_transactions => 0)
    @application_form.credit_cards.build(:number_of_transactions => 0)
    @application_form.contact_person = ContactPerson.new
    @application_form.addresses.build :address_type => 'POSTAL'
    @application_form.addresses.build :address_type => 'PHYSICAL'
    @application_form.accountant = Accountant.new
    @application_form.bartercard = Bartercard.new(:number_of_transactions => 0)
    @application_form.form_type = "SIGNUP"
  end
  
  def create
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.build(params[:application_form])
    @application_form.status = "PRICING"
    @application_form.form_type = "SIGNUP" if @application_form.form_type.blank?
    if @application_form.save
      redirect_to user_entity_path(@user, @entity)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.find(params[:id])
  end
  
  def update
    if @application_form.update_attributes(params[:application_form])
      if current_user.admin?
        redirect_to user_path(current_user)
      else
        redirect_to user_entity_application_form_path(@user, @entity, @application_form)
      end
    else
      render 'edit'
    end
  end
  
  def view
    respond_to do |format|
      format.html do
        render :layout => "pdf"
      end
      format.pdf do
        render :pdf => "show", :layout => "pdf"
      end
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.find(params[:id])
  end
  
  def print
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.find(params[:id])
    
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
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.find(params[:application_form_id])
    unless @application_form.update_attributes(params[:application_form])
      raise "Unable to update notes"
    end
    render :nothing => true
  end
  
  def update_status
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    @application_form = @entity.application_forms.find(params[:application_form_id])
    unless @application_form.update_attributes(params[:application_form])
      raise "Unable to update notes"
    end
    render :nothing => true
    @application_form.send_priced_email
  end
  
  private
    def correct_user
      if params.key?(:application_form_id)
        @user = User.find(params[:user_id])
        @entity = @user.entities.find(params[:entity_id])
        @application_form = @entity.application_forms.find(params[:application_form_id])
      else
        @user = User.find(params[:user_id])
        @entity = @user.entities.find(params[:entity_id])
        @application_form = @entity.application_forms.find(params[:id])
      end
      return if current_user.admin?
      redirect_to root_path unless current_user == @application_form.entity.user
    end
end