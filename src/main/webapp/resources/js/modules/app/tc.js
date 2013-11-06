var shirtId = "_1.png";
var currentData = {};



$(function () {
	
	$("#remember_login").on('click', function(e) {
		var chk = $(this).is(":checked");
		
		if(chk) {
			$(this).val(1);
		} else {
			$(this).val(0);
		}
	});
	
	$('#news').on('click', function(e){
		var pageNum = $('#page').val();
		var a  = ajaxSend("news/json", "page=10"); 
		console.log(a);
		mGene.Tag.setTemplate.element = '<div></div>';
		mGene.Tag.setTemplate.className = 'js-stream';
		mGene.Tag.setTemplate.tagId = 'span';
		mGene.Tag.setTemplate.tagName = '';
		mGene.Tag.setTemplate.options = {"data-type" : "json", "data-set" : "data"};	
		console.log(mGene.Tag.makeTag(mGene.Tag.setTemplate));
	});
	
	$('a.dismiss').on('click', function(e){
		$('#message-drawer').addClass("hidden"); 
	});
	$(".fullname").disableSelection();
	$("#player_list").disableSelection();
	$("#field").disableSelection();      
	$(".fullname").draggable({
		revert: "invalid",
		cursor: "move",
		helper: function (event) {
			return $('<span class="fullname">' + $(this).text() + "</span>")
		},          
		drag: function (ev, ui) {
			//$(this).html("Top: "+ ui.position.top + "<br />Left: "+ ui.position.left);
			console.log("Top: " + ui.position.left + "Left: " + ui.position.top);
			console.log("pageY : " + ev.pageY);
		}
	});
	$("#field").droppable({
		tolerance: "fit",
		drop: function (ev, ui) {

			if (!ui.draggable.find("div").length) {
				console.log(ui.draggable);
				var player = $(document.createElement("div")).addClass("dropped_player").css({
//					left: ui.position.left + 650,
//					top: ui.position.top + 200
					left: ui.position.left,
					top: ui.position.top+100
				});
				player.draggable({
					revert: "invalid"
				});
				player.css("position", "absolute");
				player.prepend('<img class="dropped_shirt" src="http://static.footballuser.com/images/shirts/' + shirtId + '" />').append('<div class="dropped_name">' + ui.draggable.text() + "</div>");
				$("#field").append(player);
			}
		}
	});
	$("#addplayer").click(function () {
		var playername = jQuery.trim($("#playername").val().replace(/<\/?[^>]+>/gi, ""));
		if (playername != "") {
			$("#player_table tr:last").after('<tr height="22"><td class="flex-table-primary" style="width: 1%;"><div class="player">' + playername + '</div></td><td class="flex-table-secondary" style="padding-left: 120px;"><a class="delete_player" href="#">제거</a></td></tr>');
			$(".player").disableSelection();
			$(".player").draggable({
				revert: "invalid",
				cursor: "move",
				helper: function (event) {
					return $('<span class="dragged_name">' + $(this).text() + "</span>")
				}
			});
			$("#playername").val("")
		}
	});          

	$(".delete_players").click(function () {
		$("#player_table").find("tr:gt(0)").remove();
		return false
	});      

	function ajaxSend(url, query, parentNode, target, callback) {
		$.ajax({
			url: "/"+url,
			type: "POST",
			data: "q="+query,
//			contentType: "application/json; charset=utf-8",
			dataType: "json",
			beforeSend: function (x) {
//				$("#submit").attr("disabled", "disabled");
//				$("#ajaxloader3").show();
//				isPosting = true
			},
			success: function (data) {
				if(callback != undefined) callback(data);
			},
			error: function (request, error) {
				if(callback != undefined) callback(data);
			}
		});	
	}
	
		
	$("input.dropdown-toggle").on("keyup", function(e) {
		
		var $this = $(this);		    	     
		var parentNode = $this.parent()
		, url = $this.data("url")
		, target = $this.data("target")
		, query = $this.val()    
		, s;
		
		s = { parent : 	parentNode, url : url, target : target, query : query};
		
		if (query != "") {
			mGene.getDropdownList(s);
		} else {
			$(query).html("");
			$(parentNode).removeClass("dropdown open");    		      		  
		}
	});
	
	$("#settings_save").on("click", function (e) {
		$('#fav_form').submit();    	  
	});      
});
