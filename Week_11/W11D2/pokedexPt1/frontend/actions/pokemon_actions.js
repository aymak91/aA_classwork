import pokemonReducer from "../reducers/pokemon_reducer";
import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon,
});

export const receiveSinglePokemon = (payload) => {
  console.log(payload);
  return ({
    type: RECEIVE_SINGLE_POKEMON,
    payload,
  })
};

// requestAllPokemon returns a function (first fat arrow)
// gets sent to 'thunkMiddleware'
// where thunkMiddleware sees if requestAllPokemon is RETURNING a function (which is the dispatch fat arrow)
//      we see it's returning a function, so invoke requestAllPokemon
// requestAllPokemon calls the APIUtil.fetchAllPokemon() and returns a promise
// within the promise, we invoke dispatch(receiveAllPokemon(pokemon))
// which will give us our array of objects 
export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  
  // return APIUtil.fetchSinglePokemon(pokemonId)
  //   .then(pokemon => {
  //     console.log(pokemon);
  //     return dispatch(receiveSinglePokemon(pokemon))
  //   })
  return APIUtil.fetchSinglePokemon(pokemonId).then((res) =>
   { 
     return dispatch(receiveSinglePokemon(res))
    }
  );
}