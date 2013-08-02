<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/tags.jspf"%>
<script>
$.ajax({
    type: 'POST',
    dataType: 'html',
    url: '/data/live',
    success: function (html) {
    	
    	console.log(JSON.parse(html));

    },
    error: function (xhr, status, e) {

        alert(e);
    }

});
</script>
  <div class="person">
    <img src="//graph.facebook.com/100002682952388/picture" width="50" height="50" class="thumb" alt="" />
    <h3></h3>
    <ul>
      <li>${people.FULL_NAME}</li>
      <li>${people.DATE_OF_BIRTH}</li>
      <li>${people.NATION}</li>
      <li>${people.CLUB}</li>
      <li>${people.AGE}</li>
      <li>${people.HEIGHT}</li>
      <li>${people.WEIGHT}</li>      
      <li>${people.POSITION}</li>      
    </ul>
  </div>
  
      </div>
    </div>
   
    </div>

</div>
</body>
</html>