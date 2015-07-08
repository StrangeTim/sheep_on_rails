class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @images = @user.images
    @image = Image.new

  end
end
