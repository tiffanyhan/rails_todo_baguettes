class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You're getting baguettes!!!"
      redirect_to root_path
    else
      flash.now[:error] = 'NO BAGUETTES FOR YOU'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end