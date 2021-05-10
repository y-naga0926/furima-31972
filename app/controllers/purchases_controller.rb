class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_signed_in, expect: [:index]
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseDestination.new
    if current_user == @item.user
      redirect_to root_path
    end
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
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


  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge( item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
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
