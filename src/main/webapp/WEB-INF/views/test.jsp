<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
const arr = [5, 6, 9, 1, 6, 3, 2, 1, 2, 7, 9, 4, 3]; 
const find1 = arr.find((element, index, array) => { // 인덱스 2인 요소를 찾을 때 까지 반복 
	console.log('콜백함수를 실행한 배열은? ', array); return index == 2; }); 
const find2 = arr.find((element, index, arr) => element === 3); 
const find3 = arr.find((e) => e > 8); 
const find4 = arr.find((e) => e > 10); 
console.log('find1:', find1); 
console.log('find2:', find2); 
console.log('find3:', find3); 
console.log('find4:', find4);


	
</script>
</body>
</html>