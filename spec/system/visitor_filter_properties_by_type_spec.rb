require 'rails_helper'

describe 'Visitor filter properties by type' do
  it 'should view links on nav bar' do
    # Arrange
    apartamento = PropertyType.create!(description: 'Apartamento')
    casa = PropertyType.create!(description: 'Casa')
    sitio = PropertyType.create!(description: 'Sítio')

    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: casa
                      )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: apartamento
                    )
    # Act
    visit root_path
    
    #Assert
    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
  end

  it 'successfully' do
    # Arrange
    apartamento = PropertyType.create!(description: 'Apartamento')
    casa = PropertyType.create!(description: 'Casa')
    sitio = PropertyType.create!(description: 'Sítio')

    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: casa
                      )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: apartamento
                    )
    # Act
    visit root_path
    click_on 'Casa'

    # Assert
    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_link('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end
end