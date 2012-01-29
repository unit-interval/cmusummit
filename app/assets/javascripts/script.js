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
	$("#top h3").delay(2000).animate({'margin-top': 0}, 500);
	$(".arrow-nav a.up").click(function(){
		var f=$(this);
		var c=f.parent().siblings('.content');
		var d=c.scrollTop()
		var e=f.siblings('a.down');
		if (d!=0) c.animate({scrollTop: d-200}, 500, function(){
			if (c.scrollTop()==0) {
				f.addClass('up-inactive');
				e.removeClass('down-inactive');
			}
		});
		return false;
	})
	$(".arrow-nav a.down").click(function(){
		var e=$(this);
		var c=e.parent().siblings('.content');
		var d=c.scrollTop();
		var f=e.siblings('a.up');
		if (d<c.get(0).scrollHeight-c.height()) c.animate({scrollTop: d+200}, 500, function(){
			if (c.scrollTop()==c.get(0).scrollHeight-c.height()) {
				e.addClass('down-inactive');
				f.removeClass('up-inactive');
			}			
		});
		return false;
	})
	if ($("#index").length > 0) $("#home").hide();
});
