class OrdersController < ApplicationController
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
