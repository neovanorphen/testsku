class OrdersProduct < ActiveRecord::Base
  belongs_to :product , foreign_key: :product_id, validate: true
  belongs_to :order, foreign_key: :order_id, validate: true

  validates :amount, presence: true,
            numericality: { only_integer: true },
            numericality: { greater_than_or_equal_to: 1 },
            length: { in: 1..8 }


  def self.delete(param1)
    param1 = param1.gsub(/[^0-9A-Za-z]/, '')
    #param1 = param1.titleize
    stasmet='order_id = ? ', param1
    delete_all(stasmet)
  end

  def self.isProduct(param1)
    param1 = param1.gsub(/[^0-9A-Za-z]/, '')
    #param1 = param1.titleize
    stasmet=' product_id = ? ', param1
    where(stasmet).count
  end

end