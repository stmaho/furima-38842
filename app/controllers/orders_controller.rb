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
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render :new
    end
  end


  private
    def order_params
      params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phon_number).merge(user_id: current_user.id, item_id: @item_id, order_id: @order_id, token: params[:token])
    end

end