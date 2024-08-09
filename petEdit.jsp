<%@page import="com.test.sku.pet.PetVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% PetVO pet = (PetVO) request.getAttribute("pet");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pet edit</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
   function edit() {
    let no = '<%=pet.getNo()%>';    
    let weight = $('#weight').val();    
    let price = $('#price').val();
    let pic = $('#pic').val();
      
      let obj = {};
      obj.cmd = 'edit';
      obj.no = no;
      
      obj.weight = weight;
      
      obj.price = price;
      obj.pic = pic;
      
      $.ajax({
         url:'pet',
         method:'post',
         cache:false,
         data:obj,
         dataType:'json',
         success:function(res) {
            alert(res.edited ? '수정 성공':'수정 실패');
            
            if(res.edited) location.href='pet?cmd=search&&name='+ '<%=pet.getName()%>';
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
<h3>펫 수정</h3>

<table>
<tr><th>넘버</th><th>이름</th><th>출신지</th><th>무게</th><th>생일</th><th>가격</th><th>이미지</th><a href="javascript:edit();"><button>수정</button></a></tr>
	   
    <tr>
    	<td><%=pet.getNo()%></td> 
    	<td><%=pet.getName()%></td>
    	<td><%=pet.getOrigin()%></td> 
    	<td><input type="text" name="weight" id="weight" value= "<%=pet.getWeight()%>"> kg</td>
    	<td><%=pet.getBirth()%></td> 
    	<td><input type="text" name="price" id="price" value= "<%=pet.getPrice()%>"></td>
    	<div><td><img src="./img/pet/<%=pet.getPic()%>"><input type="text" name="pic" id="pic" value= "<%=pet.getPic()%>"></td></div>
    </tr>
    
    
</table>
</body>
</html>