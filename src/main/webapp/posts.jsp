<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOARD</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
.round-blue-button{
	background-color: #006bb3;
	border: white;
	color: white;
	padding: 15px 10px;
	margin: 2px 2px;
	text-align: center;
	border-radius: 8px;
}
.round-blue-button:hover{
	cursor: pointer;
	background-color: aqua;
	color: black;
}
</style>
<script>
	function check_delete(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) {
			location.href='deletepost.jsp?id=' + id;
			location.href='posts.jsp';
		}
		else location.href='posts.jsp';
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>Regdate</th>
	<th>Id</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Category</th>
	<th>ModDate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr onclick="location.href='view.jsp?id=${u.getSeq()}'">
		<td>${u.getRegdate()}</td>
		<td>${u.getSeq()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getModdate()}</td>
		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:check_delete('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><button class="round-blue-button" onclick="location.href='addpostform.jsp'">Add New Post</button>
</body>
</html>