class LikesController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @comment = Comment.find params[:comment_id]
    like = Like.new
    like.user = current_user
    like.comment = @comment
    respond_to do |format|
        if like.save
        format.html{redirect_to product_path(@product), notice: "You liked a comment"}
        format.js {render}
      else
        format.html {redirect_to product_path(@product), notice: "Failed to like a comment"}
      end
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @like = Like.find params[:id]
    @comment = Comment.find params[:comment_id]
    @like.destroy
    respond_to do |format|
      format.html{redirect_to product_path(@product), notice: "You have unliked a comment"}
      format.js {render}
    end
  end

end
