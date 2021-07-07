class Api::V1::ProductsController < ApplicationController

  before_action :set_nuvem_shop_service, :set_data

  def index
    @index_products = @nuvem_shop_service.index_products
    render json: @index_products
  end

  def show
    id = params[:id]
    @show_product = @nuvem_shop_service.show_product(id)
    render json: @show_product
  end

  def create
    data = @data
    @create_product = @nuvem_shop_service.create_product(data)
    render json: @create_product
  end

  def update
    id = params[:id]
    data = request.body.read()
    @update_product = @nuvem_shop_service.update_product(id, data)
    render json: @update_product
  end

  def destroy
    id = params[:id]
    @delete_product = @nuvem_shop_service.delete_product(id)
    render json: @delete_product
  end


  private 

  def set_nuvem_shop_service
    store_id = request.headers['HTTP_STORE_ID']
    app_token = request.headers['HTTP_APP_TOKEN']
    @nuvem_shop_service = NuvemShop.new(store_id, app_token)
  end

  def set_data
    name = params['name']
    description = params['description']
    color = params['color']
    size = params['size']
    price = params['price']
    stock_management = params['stock_management']
    stock = params['stock']
    sku = params['sku']
    weight = params['weight']
    width = params['width']
    height = params['height']
    brand = params['brand']
    barcode = params['barcode']
    published = params['published']
    categories = params['categories']
    images_array_object = params['images']

    @data =
      {
        "images": images_array_object,
        "name": name,
        "description": description,
        "brand": brand,
        "published": published,
        "categories": categories,
        "attributes": [
          {
            "pt": "color"
          }
        ],
        "variants": [
          {
            "price": price,
            "stock_management": stock_management,
            "stock": stock,
            "weight": weight,
            "width": width,
            "height": height,
            "sku": sku,
            "barcode": barcode,
            "values": [
              {
                "pt": color
              }
            ]
          }
        ]
      }
  end

end