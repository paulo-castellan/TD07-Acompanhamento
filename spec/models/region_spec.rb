require 'rails_helper'

describe Region do
  context 'validations' do
    it 'property location must be present' do
      region = Region.new
      region.valid?
      expect(region.errors.full_messages_for(:property_location)
            ).to include('Localização da propriedade não pode ficar em branco')
    end
    
    it 'property location must not be duplicated' do
      region1 = Region.create!(property_location: 'casa')
      region2 = Region.new(property_location: 'casa')
      region2.valid?
      expect(region2.errors.full_messages_for(:property_location)
            ).to include('Localização da propriedade já está em uso')
    end
  end
end