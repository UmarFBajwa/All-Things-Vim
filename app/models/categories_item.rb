class CategoriesItem < ActiveRecord::Base
  belongs_to :category, :item
end
