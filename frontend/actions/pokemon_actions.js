export const POKEMON_CONSTANTS = {
  RECEIVE_ALL_POKEMON: "RECEIVE_ALL_POKEMON",
  REQUEST_ALL_POKEMON: "REQUEST_ALL_POKEMON",
  REQUEST_SINGLE_POKEMON: "REQUEST_SINGLE_POKEMON",
  RECEIVE_SINGLE_POKEMON: "RECEIVE_SINGLE_POKEMON",
  CREATE_NEW_POKEMON: "CREATE_NEW_POKEMON",
  RECEIVE_NEW_POKEMON: "RECEIVE_NEW_POKEMON"
};


export const requestAllPokemon = () => ({
  type: POKEMON_CONSTANTS.REQUEST_ALL_POKEMON
});

export const receiveAllPokemon = (allPokemon) => {
  return({
    type: POKEMON_CONSTANTS.RECEIVE_ALL_POKEMON,
    allPokemon
  });
};


export const requestSinglePokemon = (id) =>({
  type: POKEMON_CONSTANTS.REQUEST_SINGLE_POKEMON,
  id
});

export const receiveSinglePokemon = (pokemon) => ({
  type: POKEMON_CONSTANTS.RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const createNewPokemon = (pokemon) =>({
  type: POKEMON_CONSTANTS.CREATE_NEW_POKEMON,
  pokemon
});
export const receiveNewPokemon = (pokemon) =>({
  type: POKEMON_CONSTANTS.RECEIVE_NEW_POKEMON,
  pokemon
});
