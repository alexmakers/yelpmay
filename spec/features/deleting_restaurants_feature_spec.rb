require 'rails_helper'

context 'logged out' do
  before { Restaurant.create(name: 'Ledbury', cuisine: 'French') }
  it 'cannot delete restaurants' do
    visit '/restaurants'
    expect(page).to have_content 'Ledbury'
    expect(page).not_to have_link 'Delete Ledbury'
  end
end

context 'logged in as the restaurant creator' do
  before do
    alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
    login_as(alex)

    # alex.restaurants.create(name: 'Ledbury', cuisine: 'French')
    Restaurant.create(name: 'Ledbury', cuisine: 'French', user: alex)
  end

  it 'can delete restaurants' do
    visit '/restaurants'
    click_link 'Delete Ledbury'
    expect(page).not_to have_content 'Ledbury (French)'
    expect(page).to have_content 'Successfully deleted Ledbury'
  end
end

context 'logged in as another restaurant creator' do
  before do
    alex = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
    will = User.create(email: 'will@example.com', password: '12345678', password_confirmation: '12345678')
    login_as(will)

    # alex.restaurants.create(name: 'Ledbury', cuisine: 'French')
    Restaurant.create(name: 'Ledbury', cuisine: 'French', user: alex)
  end

  it 'can delete restaurants' do
    visit '/restaurants'
    click_link 'Delete Ledbury'
    expect(page).to have_content 'Not your restaurant!'
  end
end