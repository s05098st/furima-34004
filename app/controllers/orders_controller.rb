class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @orderaddress = OrderAddress.new
  end

  def create
      @orderaddress = OrderAddress.new(orderaddress_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orderaddress_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :prefecture_city, :prefecture_block, :prefecture_building, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV['PAYJP_SECRET_KEY']   
    Payjp::Charge.create(
      amount: @item.price, 
      card: orderaddress_params[:token], 
      currency: 'jpy'                 
    )
  end

  def move_to_index
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end