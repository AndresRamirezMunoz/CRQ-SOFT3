class TypesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    @type.totalWeight = 0

    if @type.save
      redirect_to types_path
    else
      render :new
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])

    if @type.update(type_params)
      redirect_to types_path
    else
      render :edit
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end
end
