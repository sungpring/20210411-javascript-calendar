<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>||Working with elements||</title>
</head>
<body>
  <div id="div1">위의 텍스트는 동적으로 추가했습니다.</div>
  <script>
  document.body.onload = addElement;

  function addElement () {
    // create a new div element
    var newDiv = document.createElement("div");
    // and give it some content
    var newContent = document.createTextNode("환영합니다!");
    // add the text node to the newly created div
    newDiv.appendChild(newContent);

    // add the newly created element and its content into the DOM
    var currentDiv = document.getElementById("div1");
    document.body.insertBefore(newDiv, currentDiv);
  }
  </script>
</body>
</html>