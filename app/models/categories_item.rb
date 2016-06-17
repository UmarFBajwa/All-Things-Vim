class CategoriesItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :item
  validates_uniqueness_of :category_id, scope: :item_id
end
