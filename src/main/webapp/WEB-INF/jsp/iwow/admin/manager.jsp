<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html >

<head>
<style>
.row{margin-top: 50px;margin-left: auto;margin-right: auto;}
.col-lg-12{margin-left:100px;margin-right:100px;}
.table_report_text{width:100%;max-width:100%;margin-bottom:20px}
.table-bordered td,.table-bordered th{border:1px solid #ddd!important;padding:10px;text-align:center}
.table-striped>tbody>tr:nth-of-type(odd){background-color:#CCFF99}
tr:hover {background-color:#FF0000}
.col-lg-12_report{position:relative;min-height:1px;padding-right:20px;padding-left:15px}
.row_report{margin-right:50px;margin-left:150px;margin-top:20px;}
.row_report_top{margin-right:50px;margin-left:150px;margin-top:70px;}
.page-header_report{padding-bottom:5px;margin:40px 0 20px;border-bottom:1px solid #eee}
.panel-heading_report{padding:10px 30px;border-bottom:1px solid transparent;border-top-left-radius:3px;
				border-top-right-radius:3px}
.div-top{margin-top:110px;float:left;display:inline}
.row_report_delete{position: absolute;left: 220px;margin-right40px;margin-left:0px;
					margin-top:3.5px;display: inline-block;}

#myProgress {width:70%;background-color: gray;display: inline-block;}
#myBar { width: 1%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;}
 #mySidenav a {
    position: absolute; /* Position them relative to the browser window */	
    left: -80px; /* Position them outside of the screen */
    transition: 0.3s; /* Add transition on hover */
    padding: 15px; /* 15px padding */
    width: 150px; /* Set a specific width */
    text-decoration: none; /* Remove underline */
    font-size: 15px; /* Increase font size */
    color: white; /* White text color */
    border-radius: 0 5px 5px 0; /* Rounded corners on the top right and bottom right side */
}

#mySidenav a:hover {
    left: 0; /* On mouse-over, make the elements appear as they should */
}

/* The about link: 20px from the top with a green background */
#about {
    top: 120px;
    background-color: #4CAF50;
}

#blog {
    top: 180px;
    background-color: #2196F3; /* Blue */
}

#projects {
    top: 240px;
    background-color: #f44336; /* Red */
}

#contact {
    top: 300px;
    background-color: #555 /* Light Black */
}
.danger {background-color: #f44336;margin-left:160px;margin-right:0px;} /* Red */ 
.danger:hover {background: #da190b;}
.btn {
    border: none; /* Remove borders */
    color: white; /* Add a text color */
    padding: 14px 28px; /* Add some padding */
    cursor: pointer; /* Add a pointer cursor on mouse-over */
    display: inline-block;
}



</style>


<!--     Bootstrap Core CSS -->
    <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
  	
    <!-- MetisMenu CSS -->
    <link href="<c:url value="/css/metisMenu.min.css"/>" rel="stylesheet">
		
    <!-- Custom CSS(title用) -->
<%--     <link href="<c:url value="/css/sb-admin-2.css"/>" rel="stylesheet"> --%>

 	<!-- DataTables Responsive CSS -->
    <link href="<c:url value="/css/dataTables.responsive.css"/>" rel="stylesheet">
		
    <!-- Morris Charts CSS -->
    <link href="<c:url value="/css/morris.css"/>" rel="stylesheet">
     
    <!-- Custom Fonts -->
    <link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
<script>

</script>
 
</head>


<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="../label/banner.jsp" />
	
	<div id="mySidenav" class="sidenav">
  		<a href="/iwowwow/iwow/admin/manager" id="about">檢舉系統</a>
  		<a href="#" id="blog">統計系統</a>
  		<a href="#" id="projects">雜項</a>
  		<a href="/iwowwow/iwow/index" id="contact">首頁</a>
	</div>
	
	  <div class="row_report_top">
                <div class="col-lg-12_report">
                    <h1 class="page-header_report">Report Admin</h1>
                </div>
                <!-- /.col-lg-12 -->
       </div>
       <!-- /.row -->

            <div class="row_report">
                <div class="col-lg-12_report">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         		  後臺檢舉管理
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table_report_text table-bordered table-striped" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Date</th>
                                        <th>處理狀態</th>
                                        <th>Update_time</th>
                                        <th>檢舉理由</th>
                                        <th>Pic_id</th>
                                    </tr>
                              
                                </thead>
                                <tbody>
                                    <c:if test='${not empty "${reportAll}"}'>
										<c:forEach var="ra" items="${reportAll}">
										<tr>
										<td>${ra.id}</td>
										<td>${ra.date}</td>
										<td>${ra.state}</td>
										<td>12</td>
										<td>13</td>
										<td>14</td>
										</tr>
									</c:forEach>
								</c:if>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row_report_delete" id="myProgress">
  				<div id="myBar">1%</div>
	   		</div>
	   		<button class="btn danger" onclick="move()">刪除</button>
	   		<div></div>
            
            
<!-- DataTables JavaScript -->
    <script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    function move() {
    	  var elem = document.getElementById("myBar");   
    	  var width = 10;
    	  var id = setInterval(frame, 10);
    	  function frame() {
    	    if (width >= 100) {
    	      clearInterval(id);
    	    } else {
    	      width++; 
    	      elem.style.width = width + '%'; 
    	      elem.innerHTML = width * 1  + '%';
    	    }
    	  }
    	}
    
</script>

</body>

</html>