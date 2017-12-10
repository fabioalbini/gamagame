var ready = function() {

  $("input[type=radio]").click(function() {
    $("#btn-next-question").removeAttr("disabled");
    $("#btn-next-question").removeClass("disabled");
  });

  $("#btn-next-question").click(function() {
    $(this).addClass("disabled");
    $(this).attr("disabled", "disabled");
    $(this).parents("form").submit();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);