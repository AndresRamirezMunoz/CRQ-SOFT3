class RecyclesController < ApplicationController

  def index
    @recycles = Recycle.all
  end

  def new
    @recycle = Recycle.new
  end

  def create

    puts "_" * 40
    puts recycle_params

    recuperator = Recuperator.find(recycle_params[:recuperator])
    type = Type.find(recycle_params[:type])
    if(recuperator!= Recuperator.first)
      @recycle = Recycle.new(weight: recycle_params[:weight])
      @recycle.recuperator = recuperator
      @recycle.type = type

      if @recycle.save
        puts "Entra"
        redirect_to recycles_path
      else
        puts "no entra"
      end
    else
      puts "333333"
      render :new
     end
  end

  def edit
    @recycle = Recycle.find(params[:id])
  end

  def update
    recuperator = Recuperator.find(recycle_params[:recuperator])

    if(recuperator!= Recuperator.first)

      @recycle = Recycle.find(params[:id])
      @recycle.weight = recycle_params[:weight]
      @recycle.recuperator = recuperator

      if @recycle.save

        redirect_to recycles_path
      else
        render :edit
      end
    else
      redirect_to edit_recycle_path
    end
  end

  def destroy
    @recycle = Recycle.find(params[:id])

    if @recycle.save
      redirect_to recycles_path
    else
      render :edit
    end
  end

    private

  def recycle_params
    params.require(:recycle).permit(:weight, :recuperator, :type)
  end


end
