class ItemsController < ApplicationController
  # before_action :move_to_root_path, except: [:index, :show, :search], unless: :user_signed_in?


  def index
    # @items = Item.where(user_id: nil).order("created_at DESC").page(params[:page])
  end
end
