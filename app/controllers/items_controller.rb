class ItemsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  include UsersHelper

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      params[:categories].each do |id|
        CategoriesItem.create(category_id: id, item_id: @item.id)
      end
      flash[:success] = "WINNING"
      redirect_to @item
    else
      flash[:error] = "FAIL"
      redirect_to new_item_path
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      @item.categories_items.each{ |ci| ci.delete }
      params[:categories].each do |id|
        CategoriesItem.create(category_id: id, item_id: @item.id)
      end
      flash[:success] = "WINNING"
      redirect_to @item
    else
      flash[:error] = "FAIL"
      redirect_to edit_item_path(@item.id)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "DESTROYED"
    redirect_to root_path
  end

  # def admin
  #   @items = Item.all
  # end

  private
  def item_params
    params.require(:item).permit(:name, :price, :quantity, :description, :image_url)
  end

end
