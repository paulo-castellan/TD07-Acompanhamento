require 'rails_helper'

describe 'Visitor filter properties' do
  it 'should view links on nav bar' do
    # Arrange
    apartamento = PropertyType.create!(description: 'Apartamento')
    casa = PropertyType.create!(description: 'Casa')
    sitio = PropertyType.create!(description: 'Sítio')
    rio_de_janeiro  = Region.create!(property_location: 'Rio de Janeiro')
    amazonas = Region.create!(property_location: 'Amazonas')
    peter = PropertyOwner.create!(email: 'peter@parker.com', password: '123456789')
    
    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: casa, region: rio_de_janeiro, property_owner: peter
                    )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: apartamento, region: amazonas, property_owner: peter
                    )
    # Act
    visit root_path
    
    #Assert
    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
    expect(page).to have_link('Rio de Janeiro')
    expect(page).to have_link('Amazonas')
  end

  it 'of property type successfully' do
    # Arrange
    peter = PropertyOwner.create!(email: 'peter@parker.com', password: '123456789')
    
    casa = PropertyType.create!(description: 'Casa')
    apartamento = PropertyType.create!(description: 'Apartamento')
    sitio = PropertyType.create!(description: 'Sítio')
    rio_de_janeiro  = Region.create!(property_location: 'Rio de Janeiro')
    amazonas = Region.create!(property_location: 'Amazonas')
    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: casa, region: rio_de_janeiro, property_owner: peter
                      )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: apartamento, region: amazonas, property_owner: peter
                    )
    # Act
    login_as peter, scope: :property_owner
    visit root_path
    click_on 'Casa'

    # Assert
    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_link('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end

  it 'of region successfully' do
    # Arrange
    peter = PropertyOwner.create!(email: 'peter@parker.com', password: '123456789')

    apartamento = PropertyType.create!(description: 'Apartamento')
    casa = PropertyType.create!(description: 'Casa')
    sitio = PropertyType.create!(description: 'Sítio')

    rio_de_janeiro  = Region.create!(property_location: 'Rio de Janeiro')
    amazonas = Region.create!(property_location: 'Amazonas')
  
    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: casa, region: rio_de_janeiro, property_owner: peter
                      )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: apartamento, region: amazonas, property_owner: peter
                    )
    # Act
    login_as peter, scope: :property_owner
    visit root_path
    click_on 'Amazonas'

    # Assert
    expect(page).to have_css('h1', text: 'Imóveis Amazonas')
    expect(page).to have_link('Cobertura em Manaus')
    expect(page).not_to have_content('Casa com quintal em Copacabana')
  end
end