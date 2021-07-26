class RecyclesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @recycles = Recycle.all
  end

  def new
    @recycle = Recycle.new
  end

  def create
    recuperator = Recuperator.find(recycle_params[:recuperator])
    type = Type.find(recycle_params[:type])
    type.totalWeight += recycle_params[:weight].to_f
    type.save

    @recycle = Recycle.new(weight: recycle_params[:weight])
    @recycle.recuperator = recuperator
    @recycle.type = type

    if @recycle.save
      redirect_to recycles_path
    else
      render :new
    end
  end

  def edit
    @recycle = Recycle.find(params[:id])
    type = @recycle.type
    type.totalWeight -= @recycle.weight.to_f
    type.save
  end

  def update
    recuperator = Recuperator.find(recycle_params[:recuperator])

    @recycle = Recycle.find(params[:id])
    @recycle.weight = recycle_params[:weight]
    @recycle.recuperator = recuperator
    type = @recycle.type
    type.totalWeight += @recycle.weight.to_f
    type.save

    if @recycle.save

      redirect_to recycles_path
    else
      render :edit
    end
  end

  def destroy
    @recycle = Recycle.find(params[:id])

    if @recycle.destroy
      redirect_to recycles_path
    else
      puts 'no entra'
      render :edit
    end
  end

  private

  def recycle_params
    params.require(:recycle).permit(:weight, :recuperator, :type)
  end
end
