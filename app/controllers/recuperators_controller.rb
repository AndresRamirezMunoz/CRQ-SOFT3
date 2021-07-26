class RecuperatorsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @recuperators = Recuperator.all
  end

  def new
    @recuperator = Recuperator.new
  end

  def create
    @recuperator = Recuperator.new(recuperator_params)
    @recuperator.active = true

    if @recuperator.save

      redirect_to recuperators_path
    else
      render :new
    end
  end

  def edit
    @recuperator = Recuperator.find(params[:id])
  end

  def update
    @recuperator = Recuperator.find(params[:id])

    if @recuperator.update(recuperator_params)

      redirect_to recuperators_path
    else
      render :edit
    end
  end

  def destroy
    @recuperator = Recuperator.find(params[:id])
    @recuperator.active = !@recuperator.active
    if @recuperator.save
      redirect_to recuperators_path
    else
      render :edit
    end
  end

  private

  def recuperator_params
    params.require(:recuperator).permit(:nit, :fullname, :phone, :adress, :active)
  end
end
