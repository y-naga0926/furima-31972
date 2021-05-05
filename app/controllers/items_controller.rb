class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(update_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price, :description, :user, :image).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price, :description, :user, :image).merge(user_id: current_user.id)
  end
end
