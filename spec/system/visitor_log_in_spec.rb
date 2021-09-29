require 'rails_helper'
=begin
describe 'Visitor log in' do
  it 'successfully' do
    User.create!(email: 'user@user.com', password: '123456789')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Senha', with: '123456789'
    click_on 'Entrar' #mudar caso queira realizar esse teste

    expect(page).to have_content('Logou com sucesso!')
    expect(page).to have_content('user@user.com')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Entrar')
  end
end
=end