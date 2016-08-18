class FollowToggle {
  constructor($el, options) {
    this.$el = $el;
    this.userId = ($el.data("user-id") || options.userId);
    this.followState = $el.data("follow");
    this.render();
    this.handleClick();
  }

  render () {
    if(this.followState === "following" || this.followState === "unfollowing"){
      this.$el.prop("disabled", true);
    }
    else if(this.followState === true){
      this.$el.text("Unfollow!");
    }
    else{
      this.$el.text("Follow!");
    }
  }

  handleClick() {
    this.$el.on("click", (event) => {

    event.preventDefault();
    let that = this;

    if(this.followState === false){
      this.followState = "following";
      $.ajax({
        url: `/users/${that.userId}/follow`,
        type: "POST",
        dataType: "JSON",
        success(userData){
          that.toggleFollowState();
          that.render();
        }
      });
    }
    else{
      this.followState = "unfollowing";
      $.ajax({
        url: `/users/${that.userId}/follow`,
        type: "DELETE",
        dataType: "JSON",
          success(userData){
            that.toggleFollowState();
            that.render();
          }
        });
      }
    });
  }

  toggleFollowState(){
    if(this.followState === true || this.followState === "unfollowing"){
      this.followState = false;
    }
    else{
      this.followState = true;
    }
    this.$el.prop("disabled", false);

  }

}

module.exports = FollowToggle;
