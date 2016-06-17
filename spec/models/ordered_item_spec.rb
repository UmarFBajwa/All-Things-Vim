require 'rails_helper'

RSpec.describe OrderedItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :order }
end
