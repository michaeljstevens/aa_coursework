class TweetCompose {
  constructor($el) {
    this.$el = $el;
    this.$el.on("submit", (event) => {
      this.submit(event);
    });
  }

  submit(event) {

    event.preventDefault();

    $.ajax({
      url: '/tweets',
      type: 'POST',
      dataType: "JSON",
      success(formData) {
        $(':input').prop("disabled", true);
      }
    });
  }

  clearInput() {
    $(':input').text("");
  }

  handleSuccess () {
    $(':input').prop("disabled", false);
    this.clearInput();
  }
}
