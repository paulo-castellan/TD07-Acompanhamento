class PropertiesController < ApplicationController
  before_action :authenticate_property_owner!, only: [:new, :create]

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @property_types = PropertyType.all
    @regions = Region.all
  end

  def create
    @property = Property.new(property_params)
    @property_types = PropertyType.all
    @regions = Region.all
    @property.property_owner = current_property_owner
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  def my_properties
    
    @properties = current_property_owner.properties
  end

  private

  def property_params
    params.require(:property).permit(:title,
                                    :description,
                                    :rooms,
                                    :bathrooms,
                                    :pets,
                                    :parking_slot,
                                    :daily_rate,
                                    :property_type_id,
                                    :region_id,
                                    :property_owner)
  end
end
