class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:description, :category_id, :condition_id,
      :charge_id, :shipment_id, :day_id, :price, :user, :image).merge(user_id: current_user.id)
end

