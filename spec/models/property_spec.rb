require 'rails_helper'

describe Property do
  context 'validations' do
    it 'title must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:title)
            ).to include('Título não pode ficar em branco')
    end

    it 'description must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:description)
            ).to include('Descrição não pode ficar em branco')
    end
    
    it 'bathrooms must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:bathrooms)
            ).to include('Banheiros não pode ficar em branco')
    end

    it 'rooms must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:rooms)
            ).to include('Quartos não pode ficar em branco')
    end

    it 'daily rate must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:daily_rate)
            ).to include('Diária não pode ficar em branco')
    end

    it 'bathrooms must be a number' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:bathrooms)
            ).to include('Banheiros não é um número')
    end

    it 'rooms must be a number' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:rooms)
            ).to include('Quartos não é um número')
    end

    it 'daily rate must be a number' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:daily_rate)
            ).to include('Diária não é um número')
    end

    it 'bathrooms must be greater than 0' do
      property = Property.new(bathrooms: 0)
      property.valid?
      expect(property.errors.full_messages_for(:bathrooms)
            ).to include('Banheiros deve ser maior que 0')
    end

    it 'rooms must be greater than 0' do
      property = Property.new(rooms: 0)
      property.valid?
      expect(property.errors.full_messages_for(:rooms)
            ).to include('Quartos deve ser maior que 0')
    end

    it 'daily rate must be greater than 0' do
      property = Property.new(daily_rate: 0)
      property.valid?
      expect(property.errors.full_messages_for(:daily_rate)
            ).to include('Diária deve ser maior que 0')
    end


  end
end
