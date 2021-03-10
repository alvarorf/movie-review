class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show follow_user edit update]
  before_action :require_logout, only: %i[new create]
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
    #s3_service = Aws::S3::Resource.new
    @user = User.new(user_params)
    # attach_files(s3_service) if params[:user][:photo] && params[:user][:coverimage]
    @user.username = user_param[:username]
    @user.fullname = user_param[:fullname]

    if @user.save
      flash[:success] = 'Profile updated!'
      reditect_to root_path
    else
      flash.now[:message_edit] = @user.errors.full_messages
      render 'edit'
    end
  end

  def follow_user
    current_user.follow_user(params[:id])
    redirect_to user_path(params[:id])
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
    params.require(:user).permit(:photo,:coverimage,:username, :fullname, :email, :password, :password_confirmation)
  end

  def require_logout
    redirect_to home_path if current_user
  end
end
