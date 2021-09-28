require 'rails_helper'

describe 'Visitor register property' do
  it 'successfully' do
    #Arrange
    PropertyType.create!(description: 'Casa')
    
    #Act
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    select 'Casa', from: 'Tipo'
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
    PropertyType.create!(description: 'Casa')

    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco', count: 5)
    expect(Property.count).to eq(0)
  end
    
  it 'and confirms that bathrooms, daily_rate and rooms are integers' do
    #TODO: verificar que rooms, daily_rate, bathrooms são numéricos
    #Arrange
    PropertyType.create!(description: 'Casa')
    PropertyType.create!(description: 'Apartamento')
  
  
    # Act
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: 'numero de quartos 5'
    fill_in 'Banheiros', with: 'numero de banheiros 3'
    fill_in 'Diária', with: 'diaria do imóvel 500'
    select 'Casa', from: 'Tipo'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    #Assert
    expect(Property.count).to eq(0)
    expect(page).to have_content('tem que ser um número maior que 0', count: 3)
    
  end

  it 'receive an error when puts bathrooms, rooms or daily rate equal to 0' do
    # Arrange
    PropertyType.create!(description: 'Casa')
    PropertyType.create!(description: 'Apartamento')
    
    # Act
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
    expect(page).to have_content('tem que ser um número maior que 0', count: 3)
    expect(Property.count).to eq(0)
  end
end