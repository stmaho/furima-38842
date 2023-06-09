class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_new, only: [:new]
  before_action :move_to_index, only: [:edit, :update]


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
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end


end


private

def item_params
  params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :preparation_id,:image).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def move_to_new
  unless user_signed_in?
   redirect_to new_user_session_path
  end
end

def move_to_index
  unless user_signed_in? && current_user.id == @item.user_id
   redirect_to action: :index
  end
end