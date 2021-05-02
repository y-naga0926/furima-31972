class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price, :description, :user, :image).merge(user_id: current_user.id)
  end
end
