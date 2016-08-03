class CheckoutsController < ApplicationController

  def create
    redirect_to root_path
    p '***************************************************'
    p params
  end

  def show
  end

end
