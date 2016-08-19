const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');
const TweetCompose = require('./tweet_compose');




$( () => {
  // debugger
  $('.follow-toggle').each(function(idx, toggle) {
    new FollowToggle($(toggle));
  });

  $('.users-search').each(function(idx, search) {
    new UsersSearch($(search));
  });

  $('.tweet-compose').each(function(idx, tweet) {
    // debugger
    new TweetCompose($(tweet));
  });

});
