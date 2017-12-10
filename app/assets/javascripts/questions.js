var ready = function() {
  $("input[type=radio]").click(function() {
    $("#btn-next-question").removeClass("disabled");
  })
};

$(document).ready(ready);
$(document).on('page:load', ready);