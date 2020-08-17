import React from 'react';
import ReactDOM from 'react-dom';
import {fetchAllPokemon, fetchSinglePokemon } from './util/api_util';
import {receiveAllPokemon, requestAllPokemon, requestSinglePokemon, receiveSinglePokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';


window.fetchAllPokemon = fetchAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;
window.requestSinglePokemon = requestSinglePokemon;
window.receiveSinglePokemon = receiveSinglePokemon;
window.fetchSinglePokemon = fetchSinglePokemon;

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const root = document.getElementById('root');

  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;

//   ReactDOM.render(<h1>Pokedex</h1>, root);
  ReactDOM.render(<Root store={store} />, root);
});