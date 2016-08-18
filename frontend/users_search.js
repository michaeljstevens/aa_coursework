const FollowToggle = require('./follow_toggle');

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$search = $('.search');
    this.$ul = $('.users');
    this.handleInput();
  }

  handleInput() {
    this.$search.on("input", (event) => {
    const that = this;
    let formData = event.target.value;
    $.ajax({
      url: `/users/search`,
      type: "GET",
      data: {query: formData},
      dataType: "JSON",
      success(userData){
        // debugger
        that.renderResults(userData);
      }
    });
  });
  }

  renderResults(userData) {
    // debugger
    this.$ul.text("");
    let that = this;
    userData.forEach((user) => {
    let li = this.$ul.append(`<li><a href='/users/${user.id}'>${user.username}</a></li>`);
      // li.append(`render: ../follows/form`);
    // li.append(`<button type="button" class="follow-toggle" name="button" data-user-id="${user.id}" data-follow="${current_user.follows?(user)}" ></button>`);
    // const currentUser = $('.current_user').data("value");
    // debugger
    li.append(`<button type="button" class="follow-toggle" name="button" data-user-id="${user.id}" data-follow="${user.followed}"></button>`);
    });

    $('.follow-toggle').each(function(idx, toggle) {
      new FollowToggle($(toggle));
    });

  }

}

module.exports = UsersSearch;
