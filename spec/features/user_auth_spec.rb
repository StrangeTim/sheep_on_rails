require 'rails_helper'

def login
  visit root_path
  click_on 'Sign In'
  fill_in 'Email', with: 'dolly@clone.com'
  fill_in 'Password', with: 'blacksheep'
  click_on 'Log in'
end

describe 'the user authorization and signup path' do
  it 'creates a new user' do
    visit root_path
    click_on 'Signup'
    fill_in 'Email', with: 'dolly@clone.com'
    fill_in 'Password', with: 'blacksheep'
    fill_in 'Password confirmation', with: 'blacksheep'
    click_on 'Sign up'
    expect(page).to have_content 'You are logged in as'
  end

  it 'logs in a user' do
    test_user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'dolly@clone.com'
    fill_in 'Password', with: 'blacksheep'
    click_on 'Log in'
    expect(page).to have_content 'You are logged in as'
  end

  it 'logs a user out' do
    test_user = FactoryGirl.create(:user)
    login
    click_on 'Logout'
    expect(page).to have_content 'Sign In'
  end
end
