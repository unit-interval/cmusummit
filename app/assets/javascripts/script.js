$(function() {
	var header = $('div.header');
	$('#douno-nav h3').click(function(){
		$('#douno').slideToggle(500);
		$(this).toggleClass('active');
	})
	$(window).scroll(function(){
		if ($(window).scrollTop() < 5 && header.hasClass('active')) header.removeClass('active');
		if (!header.hasClass('active') && $(window).scrollTop() > 5) header.addClass('active');
	})
	if ($("#voice").length > 0) {
		var a = $("#voice div.content");
		var b = a.find("div.voice-quote");
		var n = b.length;
		var m = Math.floor(Math.random()*n);
		var c = $(b[m]);
		c.show();
	}
	$('h1.tab-nav a').click(function(){
		var i = $(this).data("tab");
		$('#'+i).show().siblings('div').hide();
		$(this).addClass('active').siblings('a').removeClass('active');
		return false;
	})
	$('.speaker-info .bio .read-more').click(function(){
		$(this).hide().next('p').show();
		return false;
	})
	$("#top h3").delay(2000).animate({'margin-top': 5}, 500);
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
//	if ($("#index").length > 0) $("#home").hide();
/*	if ($("#douno").length > 0) {
		var a = $("#douno");
		var b = a.find("div");
		var n = b.length;
		var m = Math.floor(Math.random()*n);
		var c = $(b[m]);
		c.hide();
	}*/
	
	$(function(){
		$("#register form input").focus(function(){
			$(this).parent().siblings('span').fadeOut(100);
		})
		$("#contest form input").focus(function(){
			$(this).parent().siblings('span').fadeOut(100);
		})
		$("#contest form textarea").focus(function(){
			$(this).parent().siblings('span').fadeOut(100);
		})
		$("#forget-button").click(function(){
			$("#forget").slideDown(100);
		})
	})
	$("#facebook-link-button").click(function(){
		$("#connect-social-network-intro").hide(100);
		$("#facebook-link-form").show(100);
		$("#renren-link-form").hide(100);
	})
	$("#renren-link-button").click(function(){
		$("#facebook-link-form").hide(100);
		$("#renren-link-form").show(100);
	})
	$("#change-profile-button").click(function(){
		$("#update-info").addClass('active');
		return false;
	})
	$("#change-password-button").click(function(){
		$("#update-password-div").slideDown(100);
		return false;
	});
    bind_ajax_anchors();
});


function randomFactScroll() {
	var a = $("#random-fact dd");
	if (a.scrollTop()<a.get(0).scrollHeight-a.height()) a.animate({scrollTop: "+=40"}, 500);
	else a.animate({scrollTop: "0"}, 500)
}
function bind_ajax_anchors() {
  $.ajaxSetup({
    cache: false,
    dataType: 'json'
  });
  $('a[data-ajax="true"][data-role="follow"]').each(function() {
    var $a = $(this);
    $a.click(function(e){
      e.preventDefault();
      $.ajax({
        url: $a.attr('href'),
        success: function(data) {
          var html;
          if(! data.ok) return;
          if(data.follower_count-- > 1) {
			if ($('div#wrapper').hasClass('zh')) html = '你和' + data.follower_count + '人正在关注';
			else html = 'You and ' + data.follower_count + ' people are following';
          } 
		  else {
			if ($('div#wrapper').hasClass('zh')) html = '你正在关注';
			else html = 'You are following';
          }
          $a.hide()
            .siblings('div[data-role="follower-count"]').html(html).end()
            .parents('h4[data-role="follower-count"]').html(html);
        }
      });
      return false;
    });
  });
  $('a[data-ajax="true"][data-role="unfollow"]').each(function() {
    var $a = $(this);
    $a.click(function(e){
      e.preventDefault();
      $.ajax({
        url: $a.attr('href'),
        success: function(data) {
          if(! data.ok) return;
          $a.parents('.speaker-info, .session-info').fadeOut();
        }
      });
      return false;
    });
  });
}
