class PhotographsController < ApplicationController
  @logged_in_user = nil
  
  before_filter :fetch_authenticated_user
  
  def fetch_authenticated_user
    if current_user
      @logged_in_user=current_user
    else
      redirect_to login_path
    end
  end
  
  def upload
    @photograph = Photograph.new(params[:photograph])
  end
  
  def create
    @photograph = Photograph.new(params[:photograph])
    @photograph.user_id = @logged_in_user.id
    
    if @photograph.save
      flash[:notice] = "Upload successful."
      redirect_to root_url
    else
      render :action => 'upload'
    end
  end
end
