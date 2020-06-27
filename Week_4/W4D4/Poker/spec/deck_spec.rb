require 'rspec'
require 'deck'

describe Deck do
    subject(:d) {Deck.new}

    describe "#initialize" do
    
        it "deck should have 52 cards" do
            expect(d.deck.length).to eq(52)
        end
        
        before(:each) do
            hash = Hash.new {|h,k| h[k] = []}
            d.deck.each do |card|
                hash[card.suit] << card.value
            end
        end

        it "should have four suits and 13 cards for each suit" do
            expect(hash.all? {|key, val| val.sort == (1..13).to_a}).to be true
        end

    end

end