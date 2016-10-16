$("#formAuth").on("submit",function(e) {
  e.preventDefault();
  var $this = $("#formAuth");
  var $message = $this.attr("data_message_submit");
  $state = $this.find('button > .state');
  $this.addClass('loading');
  $state.html($message);
  setTimeout(function() {
    $this.off("submit").trigger("submit");
  }, 1500);
});