class OrdersController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    DeliverAdress.create(address_params)
  end

end

private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phon_number).marge(user_id: current_user.id, item_id: params[:item_id])
  end
