  var shirtId = "_1.png";
  var currentData = {};
  $(function () {
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
//	                      left: ui.position.left + 650,
//	                      top: ui.position.top + 200
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

      function ajaxSend(url, query, parentNode, target) {
          $.ajax({
              url: "http://localhost:8080/"+url,
              type: "POST",
              data: "q="+query,
//              contentType: "application/json; charset=utf-8",
              dataType: "json",
              beforeSend: function (x) {
//                  $("#submit").attr("disabled", "disabled");
//                  $("#ajaxloader3").show();
//                  isPosting = true
              },
              success: function (result) {
            	  $('#'+target).html("");
            	  if(result.jsonData.length > 0) {
                      $(parentNode).removeClass("open");
                      $(parentNode).addClass("dropdown open");
            		  var a, b, c, d ,e ,f, l = "";
                      for (var i in result.jsonData) {
                		  var uiData = "";
                		  var addData = "";
                          var obj = result.jsonData[i];                          
                          var unique_id = obj.UNIQUE_ID;
                          var no = obj.NO;
                          var name = obj.NAME;
                          var status = obj.STATUS;
                        	  
                          if(obj.FULL_NAME != undefined) name =  obj.FULL_NAME;
                                                    
                          uiData += '<li data-no="'+no+'" data-player-screenname="'+name+'" class="typeahead-item" id="players">';
                          uiData += '<a class="js-nav" data-query-source="typeahead_click" data-search-query="club-'+no+'" data-ds="account" href="#">';
                          uiData += '<img width="24" height="24" class="avatar size24" src="http://localhost:8080/resources/images/premiership/normal/'+unique_id+'.png">';
                          uiData += '<span class="fullname">'+name+'</span>';					      
                          uiData += '<span class="js-verified hidden"><span class="icon verified"><span class="visuallyhidden">인증된 계정</span></span></span>';						        	
                          uiData += '<button class="btn flex-table-btn js-submit" type="button" id="addClub">추가하기</button>';
                          uiData += '<input type="hidden" id="club-'+no+'">';
                		  uiData += '</a>';
                		  uiData += '</li>';                        		  
                		  
                          addData += '<li class="supplement visible-supplement">';
                          addData += '<div class="account js-actionable-user js-profile-popup-actionable " data-screen-name="Atsuhiro6" data-user-id="584416096">';
                          addData += '<div class="content">';
                          addData += '<div class="stream-item-header">';
                          addData += '<a class="account-group js-user-profile-link" href="">';
                		  addData += '<img class="avatar js-action-profile-avatar size73 js-tooltip" src="http://localhost:8080/resources/images/premiership/normal/'+unique_id+'.png" alt="">';
                		  addData += '<strong class="fullname js-action-profile-name">'+name+'</strong>';
                		  addData += '<span>&rlm;</span>';
                		  addData += '<span class="username js-action-profile-name">'+status+'</span>';
                		  addData += '</a>';
                		  addData += '</div>';
                		  addData += '<p class="bio">';
                		  addData += '</p>';
                          addData += '<div class="user-actions btn-group follow-combo not-following ">';
                          addData += '	<button class="js-follow-btn follow-button btn" type="button">';
                          addData += '	<span class="button-text follow-text"><i class="follow"></i> 삭제</span>';
                          addData += '	</button>';
                          addData += '<input type="hidden" name="clubs" value='+unique_id+'>';
                          addData += '</div>';                		  
                		  addData += '</div>';
                		  addData += '</div>';
                		  addData += '</li>';
                		  
                		  $('#'+target).append(uiData);
                		  
                		  $('#club-'+no).val(addData);
                      }
                      uiData += '<li class="js-selectable typeahead-accounts-shortcut js-shortcut" style=""><a class="js-nav" href="/search/users?q=d" data-search-query="d" data-query-source="typeahead_click" data-shortcut="true" data-ds="account_search"><strong>'+query+'</strong>에 대한 모든 클럽 검색</a></li>';
                      $('#'+target).append(uiData);
                      //$('#'+target).html(uiData);                      
                    $(".fullname").draggable({
                    revert: "invalid",
                    cursor: "move",
                    helper: function (event) {
                        return $('<span class="fullname">' + $(this).text() + "</span>");
                    },
                    drag: function (ev, ui) {                        
                        console.log("pageX : "+ev.pageX +"pageY : "+ev.pageY);
                        console.log(ev);
                    }
                });
                    $("a.js-nav").on("click", function (e) {
                  	                    	  
                  	  var $this = $(this).attr('data-search-query');                  	  
                  	  var appendData = $("#"+$this).val();
                  	  var items = $($this).data();
                  	  console.log(items);
                  	  $("#clubPreview").append(appendData);                    
                  	  $(e.target.parentNode).remove();    	  
                    });                    
            	  } else {
            		  $(query).html("");
            		  $(parentNode).removeClass("dropdown open"); 
            	  }
              },
              error: function (request, error) {
            	  console.log(error);
              }
          });    	      	 
      }
      $("input.dropdown-toggle").on("keyup", function(e) {
    	  var currentTarget = e.target    	      	  	
    	  	, parentNode = currentTarget.parentNode
    	  	, url = $(currentTarget).attr("data-url")
    	  	, target = $(currentTarget).attr("data-target")
    	  	, query = $(currentTarget).val();    	  
    	  if (query != "") {    		  
    		  ajaxSend(url, query, parentNode, target);    		  
    	  } else {
    		  $(query).html("");
    		  $(parentNode).removeClass("dropdown open");    		      		  
    	  }
      });
      
      $("#settings_save").on("click", function (e) {
    	  $('#fav_form').submit();    	  
      });      
  });
  
  function allowDrop(ev)
  {
      ev.preventDefault();
  }
   
  function drag(ev)
  {
	  console.log(ev);
      ev.dataTransfer.setData("Text", ev.target.getAttribute("id"));
  }
   
  function drop(ev)
  {    
      var data =  document.getElementById(ev.dataTransfer.getData("Text"));      
      ev.preventDefault();
       console.log(ev.target.parentNode);
       if(data != null) {
      var player = $(document.createElement("div")).addClass("dropped_player").css({
          left: ev.x,
          top: ev.y
      });
      
      player.css("position", "absolute");
      player.attr("draggable", true);
      player.prepend('<img class="dropped_shirt" src="http://static.footballuser.com/images/shirts/' + shirtId + '" />').append('<div class="dropped_name"> </div>');
      $(ev.target.parentNode).append(player);
       }
  }  