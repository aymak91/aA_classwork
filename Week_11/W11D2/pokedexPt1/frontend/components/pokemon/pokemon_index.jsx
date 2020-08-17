import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {

  componentDidMount() {
    this.props.requestAllPokemon();
  }


  render() {
    if(!this.props.pokemon) {
      return null;
    }
  const pokemon =   this.props.pokemon.map((pokemon) => {
    return (
      <PokemonIndexItem pokemon={pokemon} key={pokemon.id} />
    );
  })
  // console.log(pokemon);

    return <ul>{pokemon}</ul>;
  }
}
export default PokemonIndex;