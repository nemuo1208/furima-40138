class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end



  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :product_condition_id, :delivery_charge_id, :area_of_origin_id, :days_to_ship_id, :image, ).merge(user_id: current_user.id)
  end

end