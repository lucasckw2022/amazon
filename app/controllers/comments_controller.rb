class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @product = Product.find params[:product_id]
    comment_params = params.require(:comment).permit([:body,:star])
    @comment = Comment.new comment_params
    @comment.product = @product
    @comment.user = current_user
    respond_to do |format|
        if @comment.save
       format.html {redirect_to product_path(@product)}
       format.js { render :create_success }
      else
        format.html {render "/products/show"}
        format.js {render :create_failure}
      end
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @comment = @product.comments.find params[:id]
    respond_to do |format|
        if session[:user_id] == @comment.user_id
          @comment.destroy
        format.html{redirect_to product_path(@product)}
        format.js {render :destroy}
      else
        flash[:notice] = "You cannot delete this record!!"
        format.html {render "/products/show"}
      end
    end
  end

private



end
