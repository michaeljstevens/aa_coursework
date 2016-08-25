export const fetchAllPokemon = (success)=>{

  $.ajax({
    url: 'api/pokemon',
    method: "GET",
    success
  });
};
