export const POKEMON_CONSTANTS = {
  RECEIVE_ALL_POKEMON: "RECEIVE_ALL_POKEMON",
  REQUEST_ALL_POKEMON: "REQUEST_ALL_POKEMON"
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
