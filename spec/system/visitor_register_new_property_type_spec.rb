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
end

