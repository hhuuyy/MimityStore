<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2>Phân quyền sử dụng</h2>
<br>

<label><h3>Cấp bậc</h3></label>
<select id="role" class="form-group">
	<c:forEach var="r"  items="${roles}">
		<option value="${r.id}">${r.name}</option>
	</c:forEach>
</select>
<br><br/><br/>
<h3>Quyền sử dụng</h3><br>
<c:forEach var="a"  items="${actions}">
	<p class="col-sm-3">
		<label>
			<input type="checkbox"  value="${a.id}">
			${a.description}
		</label>
	</p>
</c:forEach>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<script>
$(function(){
	$("#role").change(function(){
		rid = $(this).val();
		$.ajax({
			url:"admin/action-role/get-actions.php",
			data:{rid:rid},
			dataType:"json",
			success:function(response){
				$(":checkbox").prop("checked", false);
				$(response).each(function(index, item){
					$(":checkbox[value="+item+"]").prop("checked", true);	
				});
			}
		});
	});
	
	// click checkbox
	$(":checkbox").click(function(){
		aid = $(this).val();
		state = $(this).prop("checked");
		rid = $("#role").val();
		
		$.ajax({
			url:"admin/action-role/update.php",
			data:{aid:aid, rid:rid, state:state},
			success:function(response){
				//alert(response);
			}
		});
	});
});
</script>
