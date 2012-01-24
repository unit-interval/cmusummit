$(function() {
  $("#contest > h1 > a").click(function() {
    var b = $(this);
    var a = b.html().toLowerCase();
    b.siblings().removeClass("active");
    b.addClass("active");
    $("#contest .content").removeClass("active");
    $("#contest #" + a).addClass("active");
    return false;
  });
  $("#info > h1 > a").click(function() {
    var b = $(this);
    var a = b.html().toLowerCase();
    b.siblings().removeClass("active");
    b.addClass("active");
    $("#info .content").removeClass("active");
    $("#info #" + a).addClass("active");
    return false;
  });
});
