class UsersController < ApplicationController
  before_action :check_user, except: [:new, :create]
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)

    if @user.save
      SendEmailJob.set(wait: 5.seconds).perform_later(@user)
      flash[:login] = "Successful Registration"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:login_fail] = "Failed Registration"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to root_path
    else
      flash[:warning] = "Profile was not updated"
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
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
