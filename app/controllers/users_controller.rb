class UsersController < ApplicationController
  before_action :require_login, only: %i[show follow_user edit update]
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
    s3_service = Aws::S3::Resource.new(
      region: 'us-east-1',
      access_key_id: ENV['ACCESS_KEY'],
      secret_access_key: ENV['SECRET_ACCESS_KEY']
    )
    @user = User.new(user_params)
    attach_files(s3_service) if params[:user][:photo] && params[:user][:coverimage]
    @user.username = user_params[:username]
    @user.fullname = user_params[:fullname]

    if @user.save
      flash[:success] = 'Profile updated!'
      redirect_to root_path
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
    @user = User.find(current_user.id)
    @user.username = user_params[:username]
    @user.fullname = user_params[:fullname]
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to edit_user_path(current_user.id)
    else
      flash.now[:message_edit] = @user.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  def homepage; end

  private

  def user_params
    params.require(:user).permit(:username, :fullname)
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def require_logout
    redirect_to home_path if current_user
  end
end
