$(function() {
	if ($("#voice").length > 0) {
		var a = $("#voice div.content");
		var b = a.find("div.voice-quote");
		var n = b.length;
		var m = Math.floor(Math.random()*n);
		var c = $(b[m]);
		c.show();
	}
	$("#agenda > h1 > a").click(function() {
		var b = $(this);
		var a = b.html().toLowerCase();
		b.siblings().removeClass("active");
		b.addClass("active");
		$("#agenda .content").removeClass("active");
		$("#agenda #" + a).addClass("active");
		return false;
	});
	$("#people > h1 > a").click(function() {
		var b = $(this);
		var a = b.html().toLowerCase();
		b.siblings().removeClass("active");
		b.addClass("active");
		$("#people .people-page").removeClass("active");
		$("#people #" + a).addClass("active");
		return false;
	});
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
	if ($("#random-fact").length > 0) {
		var a = $("#random-fact dd");
		var n = a.find("span").length;
		var b = a.find("span");
		var m = Math.floor(Math.random()*n);
		var c = $(b[m]);
		c.show();
		self.setTimeout(setInterval("randomFactScroll()", 5000), 5000);
	}
	$(function(){
		$("#register form input").focus(function(){
			$(this).parent().siblings('span').fadeOut(100);
		})
		$("#forget-button").click(function(){
			$("#forget").slideDown(100);
		})
	})
	$("#facebook-link-button").click(function(){
		$("#facebook-link-form").show(100);
		$("#renren-link-form").hide(100);
	})
	$("#renren-link-button").click(function(){
		$("#facebook-link-form").hide(100);
		$("#renren-link-form").show(100);
	})
});


function randomFactScroll() {
	var a = $("#random-fact dd");
	if (a.scrollTop()<a.get(0).scrollHeight-a.height()) a.animate({scrollTop: "+=40"}, 500);
	else a.animate({scrollTop: "0"}, 500)
}
