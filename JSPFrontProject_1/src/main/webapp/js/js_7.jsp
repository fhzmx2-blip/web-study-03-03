<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
    let names=["홍길동", "심청이", "이순신", "강감찬", "춘향이"]
    let sexs=["남자", "여자", "남자", "남자", "여자"]

    document.write("<h1>회원 목록</h1>")
    document.write("<ul>")
    for(let index in names){
        document.write("<li>"+names[index]+"("+sexs[index]+")</li>")
    }
    document.write("</ul>")
    document.write("<hr>")
    document.write("<h1>회원 이름</h1>")
    for(let name of names){
        document.write("<h3>"+name+"</h3>")
    }
    document.write("<hr>")
    document.write("<h1>회원 이름</h1>")
    names.forEach((name,index)=>{
        document.write("<h3>"+(index+1)+". "+name+"</h3>")
    })
    document.write("<hr>")
    document.write("<h1>회원 이름</h1>")
    names.map((name,index)=>{
        document.write("<h3>"+(index+1)+". "+name+"</h3>")
    })
}
</script>
</head>
<body>

</body>
</html>