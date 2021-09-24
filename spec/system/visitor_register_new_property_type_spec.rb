require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    #Arrange

    #Act
    visit root_path
    click_on 'Tipos de Imóveis'
    click_on 'Novo Tipo de Imóvel'
    fill_in 'Descrição:', with: 'Casa'
    click_on 'Enviar'

    #Assert
    expect(current_path).to eq property_types_path
    expect(page).to have_content('Casa')
  end

  it 'receive an error message when register an empty property type' do
    
    visit root_path
    visit root_path
    click_on 'Tipos de Imóveis'
    click_on 'Novo Tipo de Imóvel'
    fill_in 'Descrição:', with: ''
    click_on 'Enviar'

    expect(current_path).to eq property_types_path
    expect(page).to have_content('Description can\'t be blank')
  end 

  it 'receive an error message when tries to register an already registered property type' do
    
    PropertyType.create({description: 'flats'})
    
    visit root_path
    visit root_path
    click_on 'Tipos de Imóveis'
    click_on 'Novo Tipo de Imóvel'
    fill_in 'Descrição:', with: 'flats'
    click_on 'Enviar'

    expect(current_path).to eq property_types_path
    expect(page).to have_content('Description has already been taken')
  end 
end

