class PropertyTypesController < ApplicationController
  
  def index
    @property_types = PropertyType.all
  end

  def show
    @property_type = PropertyType.find(params[:id])
  end

  def new
    @property_type = PropertyType.new
  end

  def create
    @property_type = PropertyType.new(params.require(:property_type).permit(:description))
    
    if @property_type.save
      redirect_to property_types_path, notice: "Tipo de imóvel Criado com sucesso."
    else
      render 'new'
    end
  end
end
