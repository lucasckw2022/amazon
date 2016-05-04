class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def new
    @product = Product.new
    @question.user = current_user
    # render :new
  end
  def create
    product_params = params.require(:product).permit([:title,:description,:price,:sale_price,:category_id])
    @product = Product.new(product_params)
    if @product.save
     # render :show
     # redirect_to question_path({id: @question.id})
     redirect_to product_path(@product)
   else
     # this will render `app/views/questions/new.html.erb` because the default
     # in this action is to render `app/views/questions/create.html.erb`
     render :new
   end
  end
  def show
    @product = Product.find params[:id]
    @comment = Comment.new
    if @product.category_id
      @category = Category.find(@product.category_id).name
    else
        @category = "Not Specify"
    end
  end
  def index
    @products = Product.order("id").all
  end
  def edit
    @product = Product.find params[:id]
  end
  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title,:description,:price])
    if @product.update product_params
      @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end

  # private
  #
  # def user_favourite
  #   @user_favourite ||= @product.favourite_for(current_user)
  # end
  # helper_method :user_favourite
  #
  # def user_like(c)
  # Like.where(["user_id = ? and comment_id =?", current_user.id, c])[0] if current_user
  # end
  # helper_method :user_like

end
