class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
end

private

def message_params
  params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :preparation_id,:image).merge(user_id: current_user.id)
end