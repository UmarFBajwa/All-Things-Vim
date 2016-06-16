class CreateCategoriesItems < ActiveRecord::Migration
  def change
    create_table :categories_items do |t|
      t.integer :category_id, null: false
      t.integer :item_id, null: false
      t.timestamps null: false
    end
  end
end
