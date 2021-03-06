class CategoriesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      flash[:success] = "CREATED"
      redirect_to categories_path
    else
      flash[:error] = "FAIL"
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(categories_params)
      flash[:success] = "WINNING"
      redirect_to @category
    else
      flash[:error] = "FAIL"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "DESTROYED"
    redirect_to categories_path
  end

  private
  def categories_params
    params.require(:category).permit(:name)
  end
end
