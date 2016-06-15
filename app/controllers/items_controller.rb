class ItemsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
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
