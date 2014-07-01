require 'rails_helper'

describe 'writing reviews' do
  before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }
  
  it 'should add the review to the restaurant' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'Not great'
    select '2', from: 'Rating'
    click_button 'Create Review'

    expect(page).to have_content 'Not great (2)'
  end
end