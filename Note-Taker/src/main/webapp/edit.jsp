<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit/Update your note here</h1>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>


		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId() %>" name="noteId" type="hidden" >
		
		
			<div class="form-group">
				<label for="title"><b>Note Title</b></label> 
				<input name="title"
				required="required" 
				type="text" 
				class="form-control" 
				id="title"
				aria-describedby="emailHelp" placeholder="Enter here"
				value="<%= note.getTitle() %>"
				
				>
			</div>
			<div class="form-group">
				<label for="content"><b>Note Content</b></label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 200px"><%= note.getContent() %>
					</textarea>
				
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your note</button>
			</div>

		</form>
	</div>



</body>
</html>