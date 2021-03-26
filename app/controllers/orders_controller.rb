class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      @buyer_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:buyer_order).permit(:postal_code, :shipment_id, :municipality, :address, :building, :phone_number, :item, :user)
  end

end
