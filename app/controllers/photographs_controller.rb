class PhotographsController < ApplicationController
  @logged_in_user = nil
  
  before_filter :fetch_authenticated_user, :except=>[:gallery, :show]
  
  def fetch_authenticated_user
    if current_user
      @logged_in_user=current_user
    else
      redirect_to login_path
    end
  end
  
  def upload
    @user_print_variants = UserPrintVariant.find(:all)
    @user_frame_variants = UserFrameVariant.find(:all)
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
  
  def gallery
    @photographs = Photograph.find(:all)
  end
  
  def show
    @photograph = Photograph.find_by_id(params[:id])
  end
  
  def edit
      @photograph = Photograph.find_by_id(params[:id])
  end

  def update
    @photograph = Photograph.find_by_id(params[:id])
    
    if @photograph.update_attributes(params[:photograph])
      flash[:notice] = "Successfully updated profile."
      redirect_to portfolio_path
    else
      render :action => 'edit'
    end
  end
  
end
