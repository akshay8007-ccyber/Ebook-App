<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
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


/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */

</style>
</head>
<body>

	<%
		User u = (User)session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
			showToast();
			function showToast(content)
			{
			    $('#toast').addClass("display");
			    $('#toast').html(content);
			    setTimeout(()=>{
			        $("#toast").removeClass("display");
			    },2000)
			}	
		</script>
		
		<c:remove var="addcart" scope="session"/>
		
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
	<h2 class="text-center mt-3 mb-4 text-primary">📚 New Books 📚</h2>
		<div class="row p-3">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4 d-flex justify-content-center">
				<div class="card crd-ho" style="width: 270px">
					<div class="card-body text-center ">
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
	</div>
	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>