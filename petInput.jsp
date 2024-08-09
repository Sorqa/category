<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 추가</title>
<style type="text/css">
#main { width:fit-content; margin:0.5em auto; padding:1em;}
   form { border:1px solid black; padding:0.5em;}
   h3 { text-align: center; }
   div:last-child { margin-top:0.3em; text-align:center; }
   label { display:inline-block; width:3em; }/* adasfadsfs */
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
   function save() {
    let name = $('#name').val();
    let origin = $('#origin').val();
    let weight = $('#weight').val();
    let birth = $('#birth').val();
    let price = $('#price').val();
    let pic = $('#pic').val();
      
      let obj = {};
      obj.cmd = 'add';
      obj.name = name;
      obj.origin = origin;
      obj.weight = weight;
      obj.birth = birth;
      obj.price = price;
      obj.pic = pic;
      
      $.ajax({
         url:'pet',
         method:'post',
         cache:false,
         data:obj,
         dataType:'json',
         success:function(res) {
            alert(res.saved ? '추가 성공':'추가 실패');
            
            //if(res.saved) location.href='pet?cmd=list';
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
<div id="main">
<h3>펫 추가</h3>
	<form>
	<div><label for="name">이름</label>
         <input type="text" name="name" id="name">
      </div>     
	  <div><label for="origin">원산지</label>
         <input type="text" name="origin" id="origin">
      </div>
      <div><label for="weight">몸무게</label>
         <input type="text" name="weight" id="weight">
      </div>
      <div><label for="birth">생일</label>
         <input type="text" name="birth" id="birth">
      </div>
      <div><label for="price">가격</label>
         <input type="number" name="price" id="price">
      </div>
      <div><label for="pic">사진</label>
         <input type="text" name="pic" id="pic">
      </div>
      <div>
         <button type="reset">취소</button>
         <button type="button" onclick="save()">저장</button>
      </div>
	</form>
</div>
</body>
</html>