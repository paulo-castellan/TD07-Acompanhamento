require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    #Arrange
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    
    #Act
    login_as property_owner, scope: :property_owner
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
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    
    # Act
    login_as property_owner, scope: :property_owner
    visit root_path
    visit root_path
    click_on 'Tipos de Imóveis'
    click_on 'Novo Tipo de Imóvel'
    fill_in 'Descrição:', with: ''
    click_on 'Enviar'

    expect(current_path).to eq property_types_path
    expect(page).to have_content('Descrição não pode ficar em branco')
  end 

  it 'receive an error message when tries to register an already registered property type' do
    property_owner = PropertyOwner.create!(email: 'admin@admin.com', password: '123456')
    PropertyType.create!({description: 'flats'})
    
    login_as property_owner, scope: :property_owner
    visit root_path
    visit root_path
    click_on 'Tipos de Imóveis'
    click_on 'Novo Tipo de Imóvel'
    fill_in 'Descrição:', with: 'flats'
    click_on 'Enviar'

    expect(current_path).to eq property_types_path
    expect(page).to have_content('Descrição já está em uso')
  end 
end

