require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :categories_items }
  it { should have_many :items }
end
