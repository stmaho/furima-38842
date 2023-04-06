class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:new]


  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
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