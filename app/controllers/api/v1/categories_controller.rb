class Api::V1::CategoriesController < ApplicationController

  before_action :set_nuvem_shop_service

  def index
    @index_categories = @nuvem_shop_service.index_categories
    render json: @index_categories
  end

  def show
    id = params[:id]
    @show_category = @nuvem_shop_service.show_category(id)
    render json: @show_category
  end

  def create
    data = request.body.read()
    @create_category = @nuvem_shop_service.create_category(data)
    render json: @create_category
  end

  def update
    id = params[:id]
    data = request.body.read()
    @update_category = @nuvem_shop_service.update_category(id, data)
    render json: @update_category
  end

  def destroy
    id = params[:id]
    @delete_category = @nuvem_shop_service.delete_category(id)
    render json: @delete_category
  end

  private 

  def set_nuvem_shop_service
    @nuvem_shop_service = NuvemShop.new
  end


end
