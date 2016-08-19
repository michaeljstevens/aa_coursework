class TweetCompose {
  constructor($el) {
    this.$el = $el;
    let count = 0;
    this.$el.on("input", (event) => {
      count++;
      $('.chars-left').text(`chars left: ${Math.floor(140 - count)}`);
    });
    $el.on("submit", this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    const formData = $(event.currentTarget).serialize();
    const that = this;
    $.ajax({
      url: '/tweets',
      type: 'POST',
      dataType: "JSON",
      data: formData,
      success(returnData) {
        $(':input').prop("disabled", true);
        that.handleSuccess(returnData);
      }
    });
  }

  clearInput() {
    $(':input').text("");
  }

  handleSuccess (returnData) {
    let tweet = JSON.stringify(returnData);
    $(':input').prop("disabled", false);
    this.clearInput();
    $('.feed').append(`<li>${tweet}</li>`);
  }
}

module.exports = TweetCompose;
