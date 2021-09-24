class PropertyTypesController < ApplicationController
  def index
    @property_types = PropertyType.all
  end

  def new
    @property_type = PropertyType.new
  end

  def create
    prop = PropertyType.create(params.require(:property_type).permit(:description))
    redirect_to property_types_path
  end
end
