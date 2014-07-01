require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  describe '#average_rating' do
    let(:kfc) { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

    it 'returns N/A if there are no reviews' do
      expect(kfc.average_rating).to eq 'N/A'
    end

    context 'with 1 review' do
      it 'returns the rating of that review' do
        kfc.reviews.create(rating: 3)
        expect(kfc.average_rating).to eq 3
      end
    end

    context 'with multiple review' do
      it 'returns the average of those reviews' do
        kfc.reviews.create(rating: 2)
        kfc.reviews.create(rating: 4)
        expect(kfc.average_rating).to eq 3
      end
    end

    context 'average review is not a whole number' do
      it 'returns the average as a float' do
        kfc.reviews.create(rating: 2)
        kfc.reviews.create(rating: 3)
        expect(kfc.average_rating).to eq 2.5
      end
    end
  end
end
