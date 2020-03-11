<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resource/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resource/index.css" />
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12"
				style="background-color: #222222; height: 34px">
				<font color="white" size="2px" style="margin-left: 5px">下载app</font>
				<div style="float: right">

					<button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModal" onclick="reg()">注册</button>
				</div>
				
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-2" style="padding-top: 10px">
				<ul>
					<li style="margin-bottom: 10px"><a class="channel" href="/">
							<img alt="" src="/resource/images/logo-index.png"
							style="width: 108px; height: 27px">

					</a></li>
					<li><a href="/?hot=1"
						class="channel-item ${article.channelId==null?'active':''}" >热点</a></li>
					<c:forEach items="${channels}" var="channel" varStatus="i">
						<li><a href="/?channelId=${channel.id}"
							class="channel-item ${channel.id==article.channelId?'active':''} ">${channel.name }</a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="col-md-7">
			<c:if test="${article.channelId==null}">

					<div style="margin: 5px 5px 5px 5px">
						<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
							<c:forEach items="${list }" var="s" varStatus="i">
								<li data-target="#carouselExampleCaptions" data-slide-to="${i.index }"
									class="${i.index==0?'active':'' }"></li>
							</c:forEach>
							</ol>
							
							
							<div class="carousel-inner">
								<c:forEach items="${list }" var="s" varStatus="i">
								<div class="carousel-item ${i.index==0?'active':'' }">
									<img src="/pic/${s.url }" class="d-block w-100 rounded" alt="..."
										style="width: 350px; height: 320px">
									<div class="carousel-caption d-none d-md-block">
										<h5>${s.title }</h5>
									</div>
								</div>	
								</c:forEach>					
							</div>
							
							
							<a class="carousel-control-prev" href="#carouselExampleCaptions"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>

					</div>
					<hr>

				</c:if>
				
				
			<c:if test="${article.channelId!=null }">
				<div class="subchannel">
					<ul>
						<li class="sub-item ${article.categoryId==null?'sub-selected':''}"><a
							href="/?channelId=${article.channelId }">全部</a></li>
						<c:forEach items="${category }" var="c">
							<li
								class="sub-item ${article.categoryId==c.id?'sub-selected':''}"><a
								href="/?channelId=${article.channelId }&categoryId=${c.id}">${c.name }</a></li>
						</c:forEach>


					</ul>
				</div>
				</c:if>
				
				
				<hr>
				<div>
					<c:forEach items="${info.list }" var="a">
						<div class="media">
							<img src="/pic/${a.picture }" class="mr-3 rounded" alt="..."
								style="width: 190px; height: 128px">
							<div class="media-body">
								<h5 class="mt-0" >
								<a href="/articleDetail?id=${a.id}" target="_blank">${a.title }</a>
								</h5>
								<p>作者:${a.user.username }····${a.hits }浏览····发布日期:<fmt:formatDate value="${a.created}"
										pattern="yyyy-MM-dd HH:mm:ss" /> </p>
							</div>
						</div>
						<hr>
					</c:forEach>
					<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
				</div>
			</div>
			
			
			
			<div class="col-md-3">
				<div class="card" style="width: 18rem; margin-top: 6px">
					<div class="card-header">最新文章</div>
					<div class="card-body">
						<!-- 最新文章 --10篇 -->
						<c:forEach items="${lastArticle.list}" var="lastArticle">
							<div class="media">
								<img src="/pic/${lastArticle.picture}" class="mr-3 rounded"
									alt="..." style="width: 60px; height: 60px">
								<div class="media-body">
									<p>${lastArticle.title }</p>
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				 </div>
			   </div>
			</div>
		</div>
		  <!-- 注册 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">用户注册</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="reg">
					
					</div>
				
				</div>
			</div>
	</div>
<script type="text/javascript">
//注册
function reg(){
	  $("#reg").load("/passport/reg");
}
function goPage(page) {
	var channelId='${article.channelId}';
	var categoryId='${article.categoryId}';
	var url="/?channelId="+channelId+"&page="+page;
	if (categoryId != "")//如果分类不为空，则传递分类的查询条件
		url = url + "&categoryId=" + categoryId;
	location.href = url;
}
</script>

</body>
</html>