json.set! 'pokemon' do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
    # json.set! 'item_ids' do
        # @pokemon.items.each do |item| 
        #     json.extract! item, :id
        # end

    # end

end

json.items do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
    end
  end
end