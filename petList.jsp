<%@page import="com.test.sku.pet.PetVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% List<PetVO> list = (List<PetVO>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pet list</title>

</head>
<body>
<h3>펫 리스트</h3>
<div id="main">
<table>
<tr><th>넘버</th><th>이름</th><th>출신지</th><th>무게</th><th>생일</th><th>가격</th></tr>
<% 
	for (int i = 0; i < list.size(); i++) { 
		PetVO pet = list.get(i);%>
    <tr>
    	<td><%=pet.getNo()%></td> 
    	<td><a href="pet?cmd=search&name=<%=pet.getName()%>"><%=pet.getName()%></a></td>
    	<td><%=pet.getOrigin()%></td> 
    	<td><%=pet.getWeight()%> kg</td>
    	<td><%=pet.getBirth()%></td> 
    	<td><%=pet.getPrice()%></td>
    </tr>
    
<%} %> 
</table>
</div>
</body>
</html>