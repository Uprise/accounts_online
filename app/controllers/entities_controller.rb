class EntitiesController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @entity = @user.entities.build
  end
  
  def change_banks
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:entity_id])
    old_form = @entity.recent_sign_up_form
    @application_form = ApplicationForm.new(old_form)
    @application_form.accountant = old_form.accountant.clone
    old_form.addresses.each do |address|
      @application_form.addresses.build(address.attributes)
    end
    old_form.bank_accounts.each do |bank_account|
      @application_form.bank_accounts.build(bank_account.attributes)
    end
    old_form.credit_cards.each do |credit_card|
      @application_form.credit_cards.build(credit_card.attributes)
    end
    @application_form.contact_person = old_form.contact_person.clone
    @application_form.bartercard = old_form.bartercard.clone
    @application_form.form_type = "CHANGE_BANK_ACCOUNTS"
    @button = 'Update bank details'
    render :template => 'application_forms/new'
  end
  
  def create
    @user = User.find(params[:user_id])
    @entity = @user.entities.build(params[:entity])
    if @entity.save
      redirect_to user_entity_path(@user, @entity)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:id])
    if @entity.update_attributes(params[:entity])
      if current_user.admin?
        redirect_to user_path(current_user)
      else
        redirect_to user_entity_path(@user, @entity), :flash => { :success => "Entity updated." }
      end
    else
      render 'edit'
    end
  end
end