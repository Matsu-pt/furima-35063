class PurchasesController < ApplicationController

  def new
  end

  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :shipping_area_id, :municipality, :address, :build, :phone_number, :purchase, :item_id).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
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
