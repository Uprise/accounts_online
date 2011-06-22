class EntitiesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @entity = @user.entities.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @entity = @user.entities.build
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
      redirect_to user_entity_path(@user, @entity), :flash => { :success => "Entity updated." }
    else
      render 'edit'
    end
  end
end