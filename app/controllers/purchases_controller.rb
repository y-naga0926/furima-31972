class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseDestination.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:price)
  end

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge( item_id: @item.id, user_id: current_user.id)
  end

end
