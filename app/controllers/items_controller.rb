class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    if @item.save
      redirect_to new_item_path(@room)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :discription, :user, :image).merge(user_id: current_user.id)
  end
end
