class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find params[:product_id]
    favourite = Favourite.new
    favourite.product = @product
    favourite.user = current_user
    # byebug
    respond_to do |format|
        if favourite.save
        format.html {redirect_to product_path(@product), notice: "You have favourited this product"}
        format.js {render}
      else
        format.html{redirect_to product_path(@product), notice: "Failed to favourite this product"}
      end
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    favourite = Favourite.find params[:id]
    favourite.destroy
    respond_to do |format|
      format.html {redirect_to product_path(@product), notice: "You have unfavourited this product"}
      format.js {render}
    end
  end

  def index
    @user= User.find current_user
    # byebug
  end
end
