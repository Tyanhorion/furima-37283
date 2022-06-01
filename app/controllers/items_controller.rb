class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]



  def index
    @items = Item.all.order(created_at: :desc)
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
    params.require(:item).permit(:item_name, :explanation, :price, :delivery_id, :prefecture_id, :category_id, :situation_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end


end
