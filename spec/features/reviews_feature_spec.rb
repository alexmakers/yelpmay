require 'rails_helper'

def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Create Review'
end

describe 'writing reviews' do
  before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }
  
  it 'should add the review to the restaurant' do
    leave_review('Not great', '2')

    expect(page).to have_content 'Not great (2)'
  end
end

describe 'average ratings' do
  before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

  it 'calculates and displays the avg rating' do
    leave_review('Poor', '2')
    leave_review('Great', '4')

    expect(page).to have_content 'Average rating: ★★★☆☆'
  end

end