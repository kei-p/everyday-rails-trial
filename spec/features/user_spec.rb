require 'rails_helper'

feature 'User management' do
  scenario 'adds a new user' do
    admin = create(:admin)
    sign_in admin
    visit root_path

    expect do
      click_link 'Users'
      click_link 'New User'
      fill_in 'Email', with: 'newuser@exmaple.com'
      find('#password').fill_in 'Password', with: 'secret123'
      find('#password_confirmation').fill_in 'Password confirmation', with: 'secret123'
      click_button 'Create User'
    end.to change(User, :count).by(1)
  end
end
