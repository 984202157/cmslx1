<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的文章</title>
</head>
<body>
<div class="form-group form-inline " >
文章标题:<input type="text" name="title" class="form-control form-control-sm" value="${article.title }"> &nbsp;&nbsp;
审核状态:
<select name="status" class="form-control form-control-sm col-sm-1">
	<option value="0" ${article.status=='0'?'selected':'' }>待审</option>
	<option value="1" ${article.status=='1'?'selected':'' }>已审</option>
	<option value="-1" ${article.status=='-1'?'selected':'' }>驳回</option>
</select>
<button style="margin-left: 30px" type="button" onclick="query()" class="btn btn-warning btn-sm">查询</button>
</div>

	<table  class="table table-bordered table-hover table-sm">
		<tr>
			<td>序号</td>
			<td>标题</td>
			<td>作者</td>
			<td>发布时间</td>
			<td>所属栏目</td>
			<td>所属分类</td>
			<td>是否热门</td>
			<td>点击量</td>
			<td>其他</td>
		</tr>
		<c:forEach items="${info.list}" var="a" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td width="350px">${a.title }</td>
			<td>${a.user.username }</td>
			<td><fmt:formatDate value="${a.created}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			<td>${a.channel.name }</td>
			<td>${a.category.name }</td>
			<td>
			<c:if test="${a.hot==0}">
				   <button type="button" class="btn btn-info btn-sm" onclick="update(${a.id},this)">否</button>
				  </c:if>
				 <c:if test="${a.hot==1}">
				   <button type="button" class="btn btn-danger btn-sm" onclick="update(${a.id},this)">是</button>
				  </c:if>
			</td>
			<td>${a.hits }</td>
			<td><button type="button" onclick="articleDetail(${a.id })" class="btn btn-link"
			data-toggle="modal" data-target="#exampleModalLong"
			>详情</button></td>
		</tr>
		</c:forEach>
	</table>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg"  role="document">
    <div class="modal-content " >
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><span id="title"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="content">
       
      </div>
      <div class="modal-footer">
        <span id="msg"></span>
        <button type="button" class="btn btn-primary" onclick="updateStatus(1)">通过</button>
        <button type="button" class="btn btn-danger" onclick="updateStatus(-1)">驳回</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
	
	<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>

</body>
<script type="text/javascript">
	function update(id,obj) {
		var hot = $(obj).text()=="是"?0:1;
		$.post("/admin/update",{id:id,hot:hot},function(flag){
			if(flag){
				  $(obj).text($(obj).text()=="是"?"否":"是")  ;//改变按钮内容  
				  $(obj).attr("class",hot==0?"btn btn-info btn-sm":"btn btn-danger btn-sm");
			}
		},"json")
	}
	function goPage(page) {
		$("#center").load("/admin/articles?page=" + page);
	}
	function query() {
		var status=$("[name='status']").val();
		var title=$("[name='title']").val();
		$("#center").load("/admin/articles?status="+status+"&title="+title);
	}
	var articleId;
	function articleDetail(id) {
		articleId=id;
		$.get("/admin/articleDetail",{id:id},function(article){
	  		$("#title").append(article.title);
	  		$("#content").append(article.content);
	  		
	  	},"json")
	}
	 function updateStatus(status) {
		   $.post("/admin/update",{id:articleId,status:status},function(flag){
			   if(flag){
				   $("#msg").append("操作成功！")
			   }else{
				   $("#msg").append("操作失败！")
			   }
		   })
	}
</script>
</html>