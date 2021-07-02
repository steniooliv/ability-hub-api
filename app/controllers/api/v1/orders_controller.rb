class Api::V1::OrdersController < ApplicationController

  require 'json'

  before_action :_set_nuvem_shop_service

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

  def _set_nuvem_shop_service
    @nuvem_shop_service = NuvemShop.new
  end

end
