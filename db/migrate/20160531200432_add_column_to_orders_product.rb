class AddColumnToOrdersProduct < ActiveRecord::Migration
  def change
    add_column :orders_products, :amount, :integer
  end
end
