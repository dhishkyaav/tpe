class UsersController < ApplicationController
  @logged_in_user = nil
  
  # before_filter :fetch_authenticated_user
  
  def fetch_authenticated_user
    if current_user
      @logged_in_user=current_user
    else
      redirect_to login_path
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def list
    @users=(User.find(:all)).count
  end
  
  def new
    @user = User.new(params[:user])
  end

  def edit
    @user = logged_in_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def portfolio
    fetch_authenticated_user
    @photographs = @logged_in_user.photographs
  end
end
