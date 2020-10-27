function splitProc(str)
{
	//str ="id=abcd&pw=1234" 인 경우
	var s = str.split("&");
	var sid = s[0].split("=");
	var spw = s[1].split("=");
	
	var id = sid[1];
	var pw = spw[1];
	//alert(id + " " + pw);
	
	return "나의 아이디는 <b style='color:red'>" + id
		+ "</b> 이고 비밀번호는 <b style ='color:blue'>" + pw
		+ "</b> 입니다.";
}