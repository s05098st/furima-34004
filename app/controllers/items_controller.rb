class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

