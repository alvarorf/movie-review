class OpinionsController < ApplicationController
  before_action :require_login, only: %i[create show index]
  def index
    @opinions = current_user.created_opinions.all
    @opinion = Opinion.new
  end

  def new; end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def create
    @opinion = Opinion.new(opinion_params)
    if @opinion.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def update; end

  def destroy; end

  def require_login
    redirect_to login_path unless current_user
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
