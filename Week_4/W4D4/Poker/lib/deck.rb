require_relative "card.rb"
class Deck
    attr_reader :deck
    def initialize
        suit_arr = ["♠".to_sym, "♥".to_sym, "♦".to_sym, "♣".to_sym]
        value_arr = (1..13).to_a
        @deck = [] 
        value_arr.each do |value|
             suit_arr.each do |suit|
                @deck << Card.new(suit, value)
             end 
        end 
        @deck.shuffle!
    end 
end 