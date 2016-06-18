class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_items
  has_many :items, through: :ordered_items
  validates_presence_of :user_id
end
