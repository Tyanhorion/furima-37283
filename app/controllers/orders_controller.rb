class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_info, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
    redirect_to root_path if @item.buy.present? || current_user == @item.user
  end

  def create
    @buy_address = BuyAddress.new(order_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def item_info
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone, :buy_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
