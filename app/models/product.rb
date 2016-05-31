class Product < ActiveRecord::Base

  has_many :orders,
           through: :order_products
  has_and_belongs_to_many :order_products,
                          foreign_key: :product_id,
                          validate: true

  validates :code, presence: true,
            length: { in: 1..8 }

  validates :price, presence: true,
            numericality: { only_integer: true },
            numericality: { greater_than: 1 },
            length: { in: 1..8 }


  def self.deleteProduct(query)
    query = query.gsub(/[^0-9A-Za-z]/, '')
    query = 'id = ?', query
    #where("name LIKE 'papel'")
    delete(query)
  end

end
