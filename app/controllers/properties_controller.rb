class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @property_types = PropertyType.all
  end

  def create
    @property = Property.new(property_params)
    @property_types = PropertyType.all
    if @property.save
      redirect_to @property
    else
      render :new
    end
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
                                    :property_type_id)
  end
end
