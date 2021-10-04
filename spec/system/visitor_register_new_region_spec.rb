require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    #Arrange
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    
    #Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Regiões'
    click_on 'Nova Região de Locação'
    fill_in 'Localidade:', with: 'Recife'
    click_on 'Enviar'

    #Assert
    expect(current_path).to eq regions_path
    expect(page).to have_content('Recife')
  end

  it 'receive an error message when register an empty region' do
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    
    login_as property_owner, scope: :property_owner
    visit root_path
    visit root_path
    click_on 'Regiões'
    click_on 'Nova Região de Locação'
    fill_in 'Localidade:', with: ''
    click_on 'Enviar'

    expect(current_path).to eq regions_path
    expect(page).to have_content('Localização da propriedade não pode ficar em branco')
  end 

  it 'receive an error message when tries to register an already registered region' do
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    Region.create!({property_location: 'Recife'})
    
    login_as property_owner, scope: :property_owner
    visit root_path
    visit root_path
    click_on 'Regiões'
    click_on 'Nova Região de Locação'
    fill_in 'Localidade:', with: 'Recife'
    click_on 'Enviar'

    expect(current_path).to eq regions_path
    expect(page).to have_content('Localização da propriedade já está em uso')
  end

end

