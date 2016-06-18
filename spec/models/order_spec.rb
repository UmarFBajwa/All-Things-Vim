require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :ordered_items }
  it { should have_many(:items).through(:ordered_items) }

end
