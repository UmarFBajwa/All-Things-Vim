class AdminsController < ApplicationController
  def index
    @items = Item.all
  end
end
