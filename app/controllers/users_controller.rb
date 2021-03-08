class UsersController < ApplicationController
  before_action :authenticate_user!, only: []
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reditect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.all
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  def homepage; end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation)
  end
end
