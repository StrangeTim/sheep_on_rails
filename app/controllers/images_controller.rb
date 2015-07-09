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
    @user = User.find(params[:user_id])
    @users = User.all
    @tag = Tag.new
    # @tagged_users = []
    # tags.each do |tag|
    #   if tag.image_id == @image.id
    #     @tagged_users.push(tag.user_id)
    #   end
    # end
    #
    # @tagged_users.each_with_index do |user_id, index|
    #   @users.each do |user|
    #     if user_id == user.id
    #       @tagged_users[index] = user.email
    #     end
    #   end
    # end

    @select_options = []
    @users.each do |user|
      @select_options.push([user.email, user.id])
    end

  end

  def edit
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @user = User.find(params[:user_id])
    @image.destroy
    redirect_to user_path(current_user)
  end

  private
  def image_params
    binding.pry
    params.require(:image).permit(:name, :caption, :photo, :user_id)
  end

end
