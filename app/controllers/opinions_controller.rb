class OpinionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @opinions = current_user.opinions.all
    @opinion = Opininion.new
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

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
