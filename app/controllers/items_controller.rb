class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else  
      render :new
    end
  end

  private

    def item_params
      params.require(:item).permit(:image, :name, :item_description, :category_id, :item_condition_id, :cost_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
    end
  end
