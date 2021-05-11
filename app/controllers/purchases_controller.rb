class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]
  def index
    @purchase = PurchaseDestination.new
    
  end

  def create
    @purchase = PurchaseDestination.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
  def redirect_root
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end


  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge( item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
