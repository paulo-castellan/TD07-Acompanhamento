require 'rails_helper'

describe 'Visitor log in' do
  context 'as property owner' do
    it 'successfully' do
      property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')

      visit root_path
      click_on 'Entrar'
      fill_in 'E-mail', with: property_owner.email
      fill_in 'Senha', with: property_owner.password
      within 'form' do
        click_on 'Entrar' #mudar caso queira realizar esse teste
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(property_owner.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Cadastrar Imóvel')
    end

    it 'and logs out' do
      property_owner = PropertyOwner.create!(email: 'owner@onwer.com', password: '123456789')

      login_as property_owner, scope: :property_owner
      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).not_to have_link('Logout')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Cadastrar Imóvel')
      expect(page).not_to have_content(property_owner.email)
    end

    it 'and create an account' do
      #TODO Fazer depois
      # Arrange
      property_owner = PropertyOwner.new(email: 'admin@admin.com', password: '123456')
      # Act
      visit root_path
      click_on 'Entrar'
      click_on 'Cadastrar'
      fill_in 'E-mail', with: 'admin@admin.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme a senha', with: '123456'
      click_on 'Cadastrar'
      
      # Assert
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Login efetuado com sucesso')
      expect(page).to have_content(property_owner.email)

    end
  end
end
