class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      flash[:notice] = "SHAZAM"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "YOU DONE MESSED UP. OR MAYBE WE DID. YOU GO BACK NOW"
      redirect_to :back
    end
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:alert] = "ALAKAZAM"
    else
      render :edit
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user)
  end

  private
  def image_params
    params.require(:image).permit(:name, :caption, :photo, :user_id)
  end

end
