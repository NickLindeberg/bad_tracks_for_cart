class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item, only: [:destroy]


  def create
    @cart.add_product(params)

    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = "There was a problem adding this item to your cart"
      redirect_to @product
    end
  end

  def destroy
    @cart_items.destroy
    redirect_to cart_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
  end


end
