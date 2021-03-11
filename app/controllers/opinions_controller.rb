class OpinionsController < ApplicationController
  before_action :require_login, only: %i[create show index]
  def index
    @opinions = current_user.created_opinions.all
    @opinion = Opinion.new
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.author_id = current_user.id
    if @opinion.save
      current_user.opinion_count += 1
      current_user.save
      redirect_to home_path
    else
      render 'show'
    end
  end

  def require_login
    redirect_to login_path unless current_user
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
