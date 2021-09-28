require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    #Arrange

    #Act
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
    
    visit root_path
    visit root_path
    click_on 'Regiões'
    click_on 'Nova Região de Locação'
    fill_in 'Localidade:', with: ''
    click_on 'Enviar'

    expect(current_path).to eq regions_path
    expect(page).to have_content('Property location can\'t be blank')
  end 

  it 'receive an error message when tries to register an already registered region' do
    
    Region.create!({property_location: 'Recife'})
    
    visit root_path
    visit root_path
    click_on 'Regiões'
    click_on 'Nova Região de Locação'
    fill_in 'Localidade:', with: 'Recife'
    click_on 'Enviar'

    expect(current_path).to eq regions_path
    expect(page).to have_content('Property location has already been taken')
  end

end

