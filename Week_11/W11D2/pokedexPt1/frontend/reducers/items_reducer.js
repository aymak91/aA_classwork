import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      let items = action.payload.items;
      let newState = Object.assign({}, state, items);
      return newState;
    default: 
      return state;
  }
}

export default itemsReducer;