class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    user = User.find(params[:user_id])
    user_id = user.id
    @tag = Tag.new(tag_params) #tag_params = image.id
    @tag.user_id = user_id
    @tag.save
    image = Image.find(params[:tag][:image_id])
    redirect_to user_image_path(user, image)
  end

  def destroy
    tag = Tag.find(params[:id])
    image = Image.find(tag.image_id)
    tag.destroy
    redirect_to user_image_path(image.user_id, image)
  end

  private
    def tag_params
      params.require(:tag).permit(:image_id, :user_id)
    end

end
