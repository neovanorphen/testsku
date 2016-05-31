json.array!(@orders_products) do |orders_product|
  json.extract! orders_product, :id, :product_id, :material_order_id,
        :amount
  json.url orders_product_url(orders_product, format: :json)
end
