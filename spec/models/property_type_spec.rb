require 'rails_helper'

describe PropertyType do
  context 'validations' do
    it 'description must be present' do
      property_type = PropertyType.new
      property_type.valid?
      expect(property_type.errors.full_messages_for(:description)
            ).to include('Descrição não pode ficar em branco')
    end

    it 'description must not be duplicated' do
      property_type1 = PropertyType.create!(description: 'casa')
      property_type2 = PropertyType.new(description: 'casa')
      property_type2.valid?
      expect(property_type2.errors.full_messages_for(:description)
            ).to include('Descrição já está em uso')
    end
  end
end