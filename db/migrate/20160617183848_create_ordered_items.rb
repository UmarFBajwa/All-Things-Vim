class CreateOrderedItems < ActiveRecord::Migration
  def change
    create_table :ordered_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :order_quantity, null: false

      t.timestamps null: false
    end
  end
end
