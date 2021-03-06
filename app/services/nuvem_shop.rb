class NuvemShop

  require 'faraday'
  require 'json'

    
  def initialize(store_id, app_token)
    @store_id = store_id
    @app_token = app_token
    header = {"Content-Type": "application/json", "Authentication": "bearer #{@app_token}"}
    @conn = Faraday.new(url: "https://api.nuvemshop.com.br/v1/#{@store_id}", headers: header)
  end
  
  
  def index_products()
    response = @conn.get("products")
    response.body
  end

  def show_product(id)
    id = id
    response = @conn.get("products/#{id}")
    response.body
  end

  def create_product(data)
    data = data.to_json
    response = @conn.post("products", data)
    response.body
  end

  def update_product(id, data)
    id = id
    data = data
    response = @conn.put("products/#{id}", data)
    response.body
  end

  def delete_product(id)
    id = id
    response = @conn.delete("products/#{id}")
    response.body
  end



  def index_categories
    response = @conn.get("categories")
    response.body
  end

  def show_category(id)
    id = id
    response = @conn.get("categories/#{id}")
    response.body
  end

  def create_category(data)
    data = data
    response = @conn.post("categories", data)
    response.body
  end

  def update_category(id, data)
    id = id
    data = data
    response = @conn.put("categories/#{id}", data)
    response.body
  end

  def delete_category(id)
    id = id
    response = @conn.delete("categories/#{id}")
    response.body
  end



  def index_orders
    response = @conn.get("orders")
    response.body
  end

  def show_order(id)
    id = id
    response = @conn.get("orders/#{id}")
    response.body
  end

end