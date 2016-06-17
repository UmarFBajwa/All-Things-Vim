class AdminsController < ApplicationController
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @items = Item.all
  end
end
