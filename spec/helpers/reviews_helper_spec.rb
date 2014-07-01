require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, :type => :helper do
  describe '#star_rating' do
    context 'not a number' do
      it 'returns the input unchanged' do
        expect(star_rating('N/A')).to eq 'N/A'
      end
    end

    context 'rating of 5' do
      it 'returns 5 black stars' do
        expect(star_rating(5)).to eq '★★★★★'
      end
    end

    context 'rating of < 5' do
      it 'returns n black stars, for rating n, plus remainder white' do
        expect(star_rating(3)).to eq '★★★☆☆'
      end
    end

    context 'non-whole number rating' do
      it 'rounds to the nearest star' do
        expect(star_rating(2.5)).to eq '★★★☆☆'
      end
    end
  end
end
