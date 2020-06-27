require 'rspec'
require 'card'

describe Card do 
    subject(:card) {Card.new(:♥, 1)}
    describe "#initialize" do 
        it "should accept a suit and assign it to @suit" do 
            expect(card.suit).to eq(:♥) 
        end 

        it "should accept a value and assign it to @value" do 
            expect(card.value).to eq(1) 
        end 
    end     

    describe "#suit" do     
        it "should get suit" do 
            expect(card.suit).to eq(:♥) 
        end 
    end 

    describe "#value" do  
        it "should get value" do 
            expect(card.value).to eq(1) 
        end
    end

end