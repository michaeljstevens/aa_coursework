const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$( () => {
  // debugger
  $('.follow-toggle').each(function(idx, toggle) {
    new FollowToggle($(toggle));
  });
});

$( () => {
  $('.users-search').each(function(idx, search) {
    new UsersSearch($(search));
  });
});
