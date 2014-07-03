require 'rails_helper'

def leave_review(thoughts, rating)
  visit '/restaurants'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Create Review'
end

describe 'writing reviews' do
  before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

  context 'logged out' do
    it 'should not display the review form' do
      visit '/restaurants'
      expect(page).not_to have_field 'Thoughts'
    end
  end
  
  context 'logged in' do
    before do
      user = User.create email: 's@s.com', password: '12345678', password_confirmation: '12345678'
      login_as user
    end
    it 'should add the review to the restaurant' do
      leave_review('Not great', '2')

      expect(page).to have_content 'Not great (★★☆☆☆)'
    end
  end
end

describe 'average ratings' do
  before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

  context 'logged in' do
    before do
      user = User.create email: 's@s.com', password: '12345678', password_confirmation: '12345678'
      login_as user
    end

    it 'calculates and displays the avg rating' do
      leave_review('Poor', '2')
      leave_review('Great', '4')

      expect(page).to have_content 'Average rating: ★★★☆☆'
    end
  end

end