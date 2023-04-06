class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

  end

end

private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phon_number).merge(user_id: current_user.id, item_id: @item_id)
  end
