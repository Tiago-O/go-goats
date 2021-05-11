class GoatsController < ApplicationController
  before_action :set_goat, only: %i[show edit update destroy]

  def index
    @goats = Goat.all
  end

  def show; end

  def new
    @goat = Goat.new
  end

  def create
    @goat = Goat.new(goat_params)
    @user = @goat.user
    if @goat.save
      redirect_to @goat
    else
      render :new
    end
  end

  def edit; end

  def update
    @goat.update(goat_params)
    @user = @goat.user
    redirect_to @goat
  end

  def destroy
    @goat.destroy
    redirect_to goats_path
  end

  private

  def set_goat
    @goat = Goat.find(params[:id])
  end

  def goat_params
    params.require(:goat).permit(:name)
  end
end
