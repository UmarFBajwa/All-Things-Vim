class AdminsController < ApplicationController
    # http_basic_authenticate_with name: "admin", password: "secret"
  def index
    @categories = Category.all
    @items = Item.all
  end
end
