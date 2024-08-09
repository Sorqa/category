<%@page import="com.test.sku.pet.PetVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% PetVO pet = (PetVO) request.getAttribute("pet");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pet detail</title>
<style type="text/css">
img { width: 60%; }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
   function deletes() {
      let no = <%=pet.getNo()%>;  
	   
      let obj = {};
      obj.cmd = 'delete';
      
      obj.no = no;
                  
      $.ajax({
         url:'pet',
         method:'post',
         cache:false,
         data:obj,
         dataType:'json',
         success:function(res) {
            alert(res.deleted ? '삭제 성공':'삭제 실패');
            
            if(res.deleted) location.href='pet?cmd=list';
         },
         error:function(xhr,status,err){
            alert('에러:' + err);
         }
      });
      return false;
   }
</script>
</head>
<body>
<h3>펫 상세보기</h3>

<table>
<tr><th>넘버</th><th>이름</th><th>출신지</th><th>무게</th><th>생일</th><th>가격</th><th>이미지</th></tr>
	   
    <tr>
    	<td><%=pet.getNo()%></td> 
    	<td><%=pet.getName()%></td>
    	<td><%=pet.getOrigin()%></td> 
    	<td><%=pet.getWeight()%> kg</td>
    	<td><%=pet.getBirth()%></td> 
    	<td><%=pet.getPrice()%></td>
    	<div><td><img src="./img/pet/<%=pet.getPic()%>"></td></div>
    </tr>
    
    
</table>
<a href="pet?cmd=editForm&no=<%=pet.getNo()%>"><button>수정</button></a>
<a href="javascript:deletes();">삭제</a>
</body>
</html>