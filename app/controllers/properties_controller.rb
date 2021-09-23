class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @property = Property.find(id)
  end

  def new
    @property = Property.new
  end

  def create
    # Strong Parameters
    property = Property.create(params.require(:property).permit(:title,
                                                        :description,
                                                        :rooms,
                                                        :bathrooms,
                                                        :pets,
                                                        :parking_slot,
                                                        :daily_rate))
    redirect_to property
  end
end
