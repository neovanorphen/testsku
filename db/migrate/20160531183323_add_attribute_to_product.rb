class AddAttributeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
  end
end
