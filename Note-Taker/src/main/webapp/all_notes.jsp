<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>All notes you can find here</h2>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3 mb-3 p-4">
					<img style="max-width:80px" src="img/notepad.png" class="card-img-top mx-auto"  alt="Card Img">
					<div class="card-body px-5" style="">
						<h4 class="card-title" ><%=note.getTitle()%></h4>
						<p class="card-text"><%=note.getContent()%></p>
						<p> <b> Last Updated : </b> <%=note.getAddedDate()%></p>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}

				s.close();
				%>
			</div>
		</div>



	</div>
</body>
</html>