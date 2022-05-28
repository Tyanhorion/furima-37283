class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]



  def index
    # @items = Item.order("created_at DESC")
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


  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :delivery_id, :prefecture_id, :user, :category_id, :situation_id, :shipping_day_id).merge(user_id: current_user.id)
  end


end
