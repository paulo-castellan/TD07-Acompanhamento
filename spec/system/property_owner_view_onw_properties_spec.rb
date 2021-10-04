require 'rails_helper'

describe 'Property Owner view onw properties' do
  it 'using menu' do
    # Arrange
    property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')

    # Act
    login_as property_owner, scope: :property_owner
    visit root_path

    # Assert
    expect(page).to have_link('Meus Imóveis', href: my_properties_properties_path)
  end

  it 'and should view owned properties' do
    
    sitio = PropertyType.create!(description: 'Sítio')
    rio_de_janeiro  = Region.create!(property_location: 'Rio de Janeiro')
    peter = PropertyOwner.create!(email: 'peter@parker.com.br', password: 123456)
    jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: 123456)
    Property.create!( title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                      property_type: sitio, region: rio_de_janeiro, property_owner: jane
                    )
    Property.create!(title: 'Cobertura em Manaus', 
                    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                    rooms: 5, bathrooms:2, parking_slot: false, daily_rate: 500, pets: true,
                    property_type: sitio, region: rio_de_janeiro, property_owner: peter
                    )

    login_as jane, scope: :property_owner
    visit root_path
    click_on 'Meus Imóveis'

    expect(page).to have_content 'Casa com quintal em Copacabana'
    expect(page).not_to have_content 'Cobertura em Manaus'
  end
end