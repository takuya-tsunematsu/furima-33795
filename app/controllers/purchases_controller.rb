class PurchasesController < ApplicationController
  before_action :move_to_index


  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      customer = Payjp::Customer.create(
        description: 'test', 
        card: purchase_params[:card_token] 
      )
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    @item = Item.find(params[:item_id])
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(   item_id: @item.id, user_id: current_user.id, card_token: params[:card_token])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end