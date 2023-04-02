class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:new]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :preparation_id,:image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
   redirect_to new_user_session_path
  end
end