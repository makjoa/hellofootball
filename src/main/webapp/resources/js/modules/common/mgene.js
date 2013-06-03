if (!mGene) {
	var mGene = {};
}
mGene = {
	setTemplate: {
		type 	: "",
		element 	: "",
		className 	: "",
		tagId 	: "",
		tagName 	: "",
		options 	: []				
	}, 				
	makeTag: function(_COMM_FIELD_OBJ_TEMPLATE) {
		
		var el = $(_COMM_FIELD_OBJ_TEMPLATE.element);
		
		if(_COMM_FIELD_OBJ_TEMPLATE.className  !== undefined)	$(el).addClass(_COMM_FIELD_OBJ_TEMPLATE.className);
		if(_COMM_FIELD_OBJ_TEMPLATE.tagId  !== undefined)			$(el).attr('id', _COMM_FIELD_OBJ_TEMPLATE.tagId);
		if(_COMM_FIELD_OBJ_TEMPLATE.tagName  !== undefined)		$(el).attr('name', _COMM_FIELD_OBJ_TEMPLATE.tagName);
		
		return el;
	},
	
	findEndTag: function(tagnames) {
		if (this.isBlank(tagnames)){
			return '';
		}
		
		splitedTagNames = tagnames.trim().split(/[\s,;]+/);
		return splitedTagNames[splitedTagNames.length-1];
	},
	
	replaceTag: function(tagnames, selectedTagName) {
		if (this.isBlank(tagnames)){
			return '';
		}
		
		splitedTagNames = tagnames.trim().split(/[\s,;]+/);
		if (splitedTagNames.length==1){
			return selectedTagName;
		} else {
			splitedTagNames[splitedTagNames.length - 1] = selectedTagName;
		}
		return splitedTagNames.join(' ');
	},
	isBlank: function(input) {
		return !(input&&input.trim().length);
	},
	getDropdownList: function(s) {
	
		this.getAjax(s, this.setDropdownList);
				
	},
	
	setDropdownList: function(s, result) {

		if(result.jsonData.length > 0) {
			t = $("#"+s.target);
			t.html("");
			
			$(s.parent).removeClass("open");
			$(s.parent).addClass("dropdown open");
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
					
				
				var $li = $("<li>");
				var $a = $("<a>");
				var $span1 = $("<span></span>");
				var $span2 = $("<span></span>");
				var $span3 = $("<span></span>");
				var $span4 = $("<span></span>");
				var $img = $("<img>");
				var $button = $("<button>");
				var $input_hidden = $("<input></input>");
				
				
				$li.addClass("typeahead-item")
				.attr("id", "players")
				.attr("data-no", "players")
				.attr("data-player-screenname", "players");
				
				$a.addClass("js-nav")
				.attr("data-no", "players")
				.attr("data-no", "players")
				.attr("data-no", "players")
				.attr("href", "#").appendTo($li);				
				
				$img.addClass("avatar size24")
				.attr("src", "http://localhost:8080/resources/images/premiership/normal/"+unique_id+".png").appendTo($a);

				$span1.addClass("fullname")
				.text(name).appendTo($a);
				$span2.addClass("js-verified hidden").appendTo($a);		
				$span3.addClass("icon verified").appendTo($span2);
				$span4.addClass("visuallyhidden")
				.text("인증된 계정").appendTo($span3);				
				
				$button.addClass("btn flex-table-btn js-submit")
				.attr("type", "button")
				.attr("id", "addClub")
				.text("추가하기").appendTo($a);
				
			
			
				uiData += '<li data-no="'+no+'" data-player-screenname="'+name+'" class="typeahead-item" id="players">';
				uiData += '<a class="js-nav" data-query-source="typeahead_click" data-search-query="club-'+no+'"  href="#">';
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

//				$('#'+s.target).append(uiData);
				t.append($li);
				$('#club-'+no).val(addData);
			}
			uiData += '<li class="js-selectable typeahead-accounts-shortcut js-shortcut" style=""><a class="js-nav" href="/search/users?q=d" data-search-query="d" data-query-source="typeahead_click" data-shortcut="true" data-ds="account_search"><strong>'+s.query+'</strong>에 대한 모든 클럽 검색</a></li>';
			//$('#'+s.target).append(uiData);		
		} else {
			$(s.target).html("");
			$(s.parent).removeClass("dropdown open"); 
		}
		
		$("a.js-nav").on("click", function (e) {

			var $this = $(this).data('search-query');                  	  
			var appendData = $("#"+$this).val();
			var items = $($this).data();		
			$("#clubPreview").append(appendData);                    
			$(e.target.parentNode).remove();    	  
		}); 		
	},
		
	getAjax: function(s, callback) {

		$.ajax({
			type        : "post",            
			url           : "http://localhost:8080/"+s.url,
			data		  : "q="+s.query,
			async      : false,			
			dataType : "json",
			beforeSend: function() {

			},
			success   : function(data){            
				if(callback != undefined) callback(s, data);
			},
			error       : function (e, state) {					
				if(callback != undefined) callback(state);                
			}
		});
	}
};