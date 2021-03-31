class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :move_to_root_path, only: [:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])
    @buyer_order = BuyerOrder.new
  end

  def new
    @buyer_order = BuyerOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buyer_order).permit(:postal_code, :shipment_id,
                                        :municipality, :address, :building, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
