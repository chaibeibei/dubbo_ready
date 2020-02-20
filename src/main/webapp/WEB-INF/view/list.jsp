<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/css/index.css">
<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
</head>
<script type="text/javascript">
function fenye(currentPage) {
	$("[name=currentPage]").val(currentPage);
	$("form").submit();
}
</script>
<body>
<form action="list" method="post">
   请按照选项排序：<select name="dim">
                    <option value="">请选择</option>
                    <c:if test="${dim=='created' }">
                    <option value="created" selected>发表时间</option>
                    </c:if>
                    <c:if test="${dim!='created' }">
                    <option value="created">发表时间</option>
                    </c:if>
                     <c:if test="${dim=='user_id' }">
                    <option value="user_id" selected>作者</option>
                    </c:if>
                    <c:if test="${dim!='user_id' }">
                    <option value="user_id">作者</option>
                    </c:if>
                     <c:if test="${dim=='commentCnt' }">
                    <option value="commentCnt" selected>评论数量</option>
                    </c:if>
                    <c:if test="${dim!='commentCnt' }">
                    <option value="commentCnt">评论数量</option>
                    </c:if>
             </select>
             <input type="date" name="start" value="${start}">
             <input type="date" name="end" value="${end}">
             <input type="hidden" name="currentPage">
            <button>确定</button>
             <table>
                <tr>
                   <td>id</td>
                   <td>文章标题</td>
                   <td>文章发布时间</td>
                   <td>作者</td>
                   <td>评论数量</td>
                   <td>文章状态</td>
                </tr>
                <c:forEach items="${pageInfo.list }" var="l">
                  <tr>
                   <td>${l.id }</td>
                   <td>${l.title }</td>
                   <td>${l.created }</td>
                   <td>${l.nickname}</td>
                   <td>${l.commentCnt }</td>
                   <td>${l.status==1?'审核通过':审核未通过 }</td>
                  </tr>
                </c:forEach>
                <tr>
		<td colspan="10">
			<button onclick="fenye(1)">首页</button>
			<button onclick="fenye(${pageInfo.prePage==0?1:pageInfo.prePage})">上一页</button>
			<button onclick="fenye(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">下一页</button>
			<button onclick="fenye(${pageInfo.pages})">尾页</button> &nbsp;&nbsp;&nbsp;&nbsp;
			当前${pageInfo.pageNum}/${pageInfo.pages}页，共${pageInfo.total}条
		</td>
	</tr>
             </table>
             
</form>
</body>
</html>