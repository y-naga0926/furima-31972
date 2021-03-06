class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_signin, only: [:edit, :update, :destroy]
  before_action :purchase_present, only: [:edit, :update]


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_signin
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :price, :description, :user, :image).merge(user_id: current_user.id)
  end
  
  def purchase_present
    if @item.purchase.present?
      redirect_to root_path
    end
  end
  
end
