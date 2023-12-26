class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :non_purchased_item, only: [:index]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
      if current_user == @item.user
        redirect_to root_path
      end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postcode, :area_of_origin_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:order_address][:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
  
  def non_purchased_item
    @sold_out_items = Order.distinct.pluck(:item_id)
    if current_user.id == @item.user_id || @sold_out_items.include?(@item.id)
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
