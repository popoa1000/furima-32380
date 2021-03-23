class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    #@buyer_order = BuyerOrder.new
  end

  def new
    @order = Order.new
  end

  def create
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.require(:buyer_order).permit(:item_id, :user_id).merge(token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
