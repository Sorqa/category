<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 화면</title>
<style type="text/css">
img { width: 60%; }
main div { display: flex; justify-content: center; margin-top: 4em;}
li { display: inline-block; width: 5em;}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function search(){
	var cat = $('#category').val();
	var keyword = $('#keyword').val();
	alert('검색할 카테고리:' + cat);
	if(cat== "name"){
	location.href='pet?cmd=search&name='+keyword;
	}else if(cat=="no"){location.href='pet?cmd=search&no='+keyword;}
}
</script>

</head>
<body>
<nav>
      <ul>
         <li><a href="pet">HOME</a>
         <li><a href="pet?cmd=addForm">ADD</a>
         <li><a href="pet?cmd=list">LIST</a>
         
      </ul>
      <div><img src="./img/pet/puppy.jpg"></div>
     <form action="pet" method="post">
     <input type="hidden" name="cmd" id="cmd" value="search">
	검색 카테고리
	<select name="category" id="category">
	<option value="no">번호</option>
	<option value="name">이름</option>
	</select>
	<input type="text" name="keyword" id="keyword">
	<button type="button" onclick="search()">검색</button>
	</form>
         
</nav>
 
</body>
</html>