export const fetchBenches = function(filters, success){
  $.ajax({
    method: 'GET',
    url: '/api/benches',
    success,
    data: filters,
    error: () => console.log('error')
  });
};
