export const fetchAllPokemon = (success)=>{

  $.ajax({
    url: 'api/pokemon',
    method: "GET",
    success
  });
};


export const fetchSinglePokemon = (id, success)=>{

  $.ajax({
    url: `api/pokemon/${id}`,
    method: "GET",
    success
  });
};
