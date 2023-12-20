class ItemsController < ApplicationController
  def index
    # ここにindexアクションのロジックを追加
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

  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :product_condition_id, :delivery_charge_id, :area_of_origin_id, :days_to_ship_id, :user, :image, ).merge(user_id: current_user.id)
  end

end