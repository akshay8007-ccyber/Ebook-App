<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho {
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	border-radius: 10px;
	overflow: hidden;
	background: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.crd-ho:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	background: #f8f9fa;
}

.img-thumbnail {
	border-radius: 10px;
}
.crd-ho {
    border-radius: 12px;
    overflow: hidden;
    background: #fff;
    transition: transform 0.3s, box-shadow 0.3s;
}
.crd-ho:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	
	<%
		User u = (User)session.getAttribute("userobj");
	%>
	
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white p-5">
			<i class="fa-solid fa-book"></i>&nbsp; EBook Management System
		</h2>
	</div>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho" style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Category :
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Category :
						<%=b.getBookCategory()%></p>
						<div class="row">
						
							<%
							if(u == null)
							{%>
							
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2">
								<i class="fa-solid fa-cart-shopping"></i>Add Cart</a> 
								
							<%
							}else
							{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">
								<i class="fa-solid fa-cart-shopping"></i>Add Cart</a> 
								
							<%
							}
							%>
						
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 mt-1">
				<div class="card crd-ho" style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getBookCategory()%></p>
						<div class="row">
							
							<%
							if(u==null)
							{%>
							
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2">
								<i class="fa-solid fa-cart-shopping"></i>Add Cart</a> 
								
							<%
							}else
							{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">
								<i class="fa-solid fa-cart-shopping"></i>Add Cart</a> 
								
							<%
							}
							%>
										
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> 
							<i class="fa-solid fa-indian-rupee-sign"></i></a>
						
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3 mt-1">
				<div class="card crd-ho" style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End Old Book -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>