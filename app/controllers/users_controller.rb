class UsersController < ApplicationController
  before_action :check_user, except: [:new, :create]
  include UsersHelper
  # def index
  #   @user = User.authenticate(user_params)
  #   if @user
  #     session[:user_id] = @user.index
  #     redirect_to root_path
  #   end
  # end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)

    if @user.save
      flash[:login] = "Successful Registration"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:login_fail] = "Failed Registration"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def check_user
    unless current_user == User.find(params[:id])
      flash[:warning] = "Not the User"
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
