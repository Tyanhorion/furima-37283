class OrdersController < ApplicationController
  def index
    @item = Item.all
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(order_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone, :buy_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end


# @buy_address.valid?
# @buy_address.errors?

