class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_products,
           foreign_key: :order_id,
           validate: true
  accepts_nested_attributes_for :orders_products,
                                allow_destroy: true,
                                reject_if: :all_blank


  def product
    Product.find(product_id)
  end
end
