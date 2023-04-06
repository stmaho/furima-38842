class OrdersController < ApplicationController

  def index
    @order = Order.create
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
  end

end

private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phon_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
