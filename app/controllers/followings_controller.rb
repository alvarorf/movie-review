class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinions = current_user.opinions.all
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
