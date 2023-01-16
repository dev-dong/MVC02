<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.bit.model.*" %>
<%
	// parameter 수집(VO)
	request.setCharacterEncoding("UTF-8");
		
	// 1. parameter 수집(VO) - VO의 하나의 정보로 묶어줌(Servlet이 작업)
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	// 기본 parameter수집 - 기본적으로 setter를 이용해서 parameter 수집함
	MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setPass(pass);
	vo.setName(name);
	vo.setAge(age);
	vo.setEmail(email);
	vo.setPhone(phone);
	
	// Model과 연동부분
	MemberDAO dao = new MemberDAO();
	int cnt = dao.memberInsert(vo);
	//PrintWriter out = response.getWriter();
	if (cnt > 0) {
		// 가입성공
		response.sendRedirect("memberList.jsp");
	} else {
		// 가입실패 -> 예외객체를 만들어서 WAS에게 throw
		throw new ServletException("Not Insert");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>