import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({}, state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON:
      let pokemon = action.payload.pokemon
      let newState = Object.assign({}, state, {[pokemon.id]: pokemon});
      console.log(newState); 
      return newState;
      // return state.pokemon[action.pokemonId];
    default:
      return state;
  }
}

export default pokemonReducer;