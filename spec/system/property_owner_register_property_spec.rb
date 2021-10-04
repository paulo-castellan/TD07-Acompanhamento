require 'rails_helper'

describe 'Property Owner register property' do
  it 'must be signed in' do
    visit root_path

    expect(page).not_to have_link('Cadastrar Imóvel')
  end
  it 'successfully' do
    #Arrange
    PropertyType.create!(description: 'Casa')
    Region.create!(property_location: 'Rio de Janeiro')
    property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')
    
    # Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    select 'Casa', from: 'Tipo'
    select 'Rio de Janeiro', from: 'Estado'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto da UFSC')
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Banheiros: 2")
    expect(page).to have_content("Aceita Pets: Sim")
    expect(page).to have_content("Estacionamento: Sim")
    expect(page).to have_content("Diária: R$ 200,00")
    expect(page).to have_content("Tipo: Casa")
  end

  it 'and must fill all fields' do
    property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')
    
    # Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    
    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Quartos não pode ficar em branco')
    expect(page).to have_content('Banheiros não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(Property.count).to eq(0)
  end
    
  it 'and confirms that bathrooms, daily_rate and rooms are integers' do
    #Arrange
    PropertyType.create!(description: 'Casa')
    Region.create!(property_location: 'Rio de Janeiro')
    property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')
    
    # Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: 'numero de quartos 5'
    fill_in 'Banheiros', with: 'numero de banheiros 3'
    fill_in 'Diária', with: 'diaria do imóvel 500'
    select 'Casa', from: 'Tipo'
    select 'Rio de Janeiro', from: 'Estado'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    #Assert
    expect(Property.count).to eq(0)
    expect(page).to have_content('Quartos não é um número')
    expect(page).to have_content('Banheiros não é um número')
    expect(page).to have_content('Diária não é um número')
    
  end

  it 'receive an error when puts bathrooms, rooms or daily rate equal to 0' do
    # Arrange
    PropertyType.create!(description: 'Casa')
    property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')

    
    # Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: 0
    fill_in 'Banheiros', with: 0
    fill_in 'Diária', with: 0
    select 'Casa', from: 'Tipo'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Quartos deve ser maior que 0')
    expect(page).to have_content('Banheiros deve ser maior que 0')
    expect(page).to have_content('Diária deve ser maior que 0')
    
    expect(Property.count).to eq(0)
  end

  it 'cant be accessed via route' do
    visit new_property_type_path

    expect(current_path).to eq(new_property_owner_session_path)
  end
end