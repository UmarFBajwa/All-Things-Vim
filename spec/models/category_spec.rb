require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :categories_items }
  it { should have_many :items }
end
