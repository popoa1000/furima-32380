class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id,
                                 :charge_id, :shipment_id, :day_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
