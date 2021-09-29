class RegionsController < ApplicationController
  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(params.require(:region).permit(:property_location))
    
    if @region.save
      redirect_to regions_path, notice: "Região de locação criado com sucesso."
    else
      render 'new'
    end
  end
end
