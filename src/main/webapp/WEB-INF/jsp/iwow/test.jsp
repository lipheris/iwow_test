<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<script>

$.ajax({
    type: 'GET',
    dataType: 'json',
    url: '/iwowwow/iwow/list',
    async: false,    
    success: function(json){
        
    		alert(json);
           	jsondata=$.parseJSON(json); //處理字串資料轉換成JSON資料結構
           	alert(jsondata);
//             var t=jsondata.data;
//             var divshow = $("#regshow");
//             divshow.text("");// 清空數據
//             h="<img id=\"mops\" src='data:image/jpg;base64,"+t+"' style=\"width:79px;height:30px;margin-right:-4px;\"/>";
        
//             divshow.append(h);                      
        
    },
     error:function() {
          
         alert("系統數據意長,請稍後再試......");
   
}


});

// window.onload = function () {
//     document.getElementById("email").onblur = chkMail;
// }

// //Email
// //1.不可空白 
// function chkMail() {
//     var theMail = document.getElementById("email").value;
//     var theMailLen = theMail.length;
//     var div = document.getElementById('result0');
    
//     if (theMailLen == "") {
//         document.getElementById("correctmail").innerHTML = "";
//         document.getElementById("errormail").innerHTML = "<img src='Img/error.gif' /> 請輸入信箱";
//     } else {
//     	document.getElementById("errormail").innerHTML = "";
    	
    	

// //     	var xhr = new XMLHttpRequest();
// // 		xhr.open("POST", "/iwowwow/iwow/member/checkUserEmail", true);
// // 		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// // 		xhr.send("email=" );
// // 		xhr.onreadystatechange = function() {
// // 			// 伺服器請求完成
// // 			if (xhr.readyState == 4 && xhr.status == 200) {
// // 				result = JSON.parse(xhr.responseText); //把JSON轉成javascript型式的物件
// // 				console.log(result);
// // // 				message = "帳號已存在";
// // // 				if (result.correctEmail.length == 0) {
// // // 					message = "帳號可用";
// // // 				}
// // // 				div.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
// //  			}
// // 		}
//     }
// }

</script>

</head>
<body>

 <div>
        <label for="email">信箱：</label>
        <input type="text" id="email" name="email">
            <span id="errormail" style="color:red"></span>
            <span id="correctmail" style="color:green"></span>
            <div id='result0' style="height: 10px;"></div>
        </div>

	
</body>
</html>