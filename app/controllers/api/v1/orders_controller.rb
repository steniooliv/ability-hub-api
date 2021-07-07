class Api::V1::OrdersController < ApplicationController

  before_action :set_nuvem_shop_service

  def index
    @index_orders = @nuvem_shop_service.index_orders
    render json: @index_orders
  end

  def show
    id = params[:id]
    @show_order = @nuvem_shop_service.show_order(id)
    render json: @show_order
  end

  def create
  end

  def update
  end

  def destroy
  end


  private 

  def set_nuvem_shop_service
    store_id = request.headers['HTTP_STORE_ID']
    app_token = request.headers['HTTP_APP_TOKEN']
    @nuvem_shop_service = NuvemShop.new(store_id, app_token)
  end

end
