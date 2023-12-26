class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]
  before_action :non_edit_item, only: [:edit]

  def index
    @sold_out_items = Order.distinct.pluck(:item_id)
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

  def show
    @sold_out_items = Order.distinct.pluck(:item_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :product_condition_id, :delivery_charge_id, :area_of_origin_id, :days_to_ship_id, :image, ).merge(user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id]) if params[:id].present?
  end

  def prevent_url
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def non_edit_item
    @item = Item.find(params[:id])
    @sold_out_items = Order.distinct.pluck(:item_id)
    if current_user.id == @item.user_id && @sold_out_items.include?(@item.id)
      redirect_to root_path
    end
  end
end