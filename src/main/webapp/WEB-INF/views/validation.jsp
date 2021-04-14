<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label for="name">이름</label><input type="text" id="name" data-check="이름"><br>
<label for="id">아이디</label><input type="text" id="id" data-check="아이디"><br>
<label for="pwd">비밀번호</label><input type="text" id="pwd" data-check="비밀번호"><br>
<label for="male">남</label><input type="radio" id="male" name="trans" data-check="성별">
<label for="female">여</label><input type="radio" id="female" name="trans">
<label for="ofinion">의견</label><input type="radio" id="ofinion"><br>
<button onclick="check()">회원가입</button>
<script>

function check(){
   var checkObjs = document.querySelectorAll('[data-check]')
   for(var checkObj of checkObjs){
      var title = checkObj.getAttribute('data-check')
      if(checkObj.type=='text'){
         var id = checkObj.id;
         var txt = document.querySelector('#'+id).value.trim();
         if(txt.length<1){
            alert(title + '은 필수값입니다.');
            document.querySelector('#'+id).focus();
            return ;
         }
      }else if(checkObj.type=='radio'){
         var name = checkObj.name;
         var radio = document.querySelector('[name=' + name + ']:checked');
         if(!radio){
            alert(title + '을 확인해주세요');
            document.querySelector('[name=' + name + ']').focus();
            return;
         }
      }
   }
   alert('이제부터 회원가입을 진행하지')
}
</script>
</body>
</html>