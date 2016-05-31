class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :code
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
