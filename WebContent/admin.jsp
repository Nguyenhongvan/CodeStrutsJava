<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <title>Admin - Quản lý cửa tiệm cầm đồ</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

      <!-- ajax -->
    <script type="text/javascript">
    	
    	//load data ajax server -> client
    	function loadDataAjax(){
			$.ajax({
				type:'POST',
				async: false,
				url:'/QuanLyCamDov1.0.4//hop-dong.do',
				cache:false,
				dataType:'json',
				success: function (response){
					var arr = [];
					
					var rs="";
					
					//chuyển đổi JSONObject -> JSON
					var JsonList=response.jsonArray;
					
					//chuyển đổi JSONObject -> JSON
					var JsonPages=response.pages;
					
					for ( var key in JsonList) {
                    	//set data from json to array
                    	arr.push(key);
                    	
                    	console.log(arr);
					}
					
					/* $.each(response, function(key, value) {
					      var tblRow = "<tr>" + "<td>" + f.id + "</td>" + "<td>" + f.user.username + "</td>" + "<td>" + f.message + "</td>" + "<td> " + f.location + "</td>" +  "<td>" + f.at + "</td>" + "</tr>"
					       $(tblRow).appendTo("#showall tbody");
					 }); */
					
					if(arr.length!=0){
						
 						for ( var re in JsonList) {
    					    	 
    					    	rs+="<tr>"
			                        	+"<th>"
						                	+""+JsonList[re].maCTHD+""
										+"</th>"
						                +"<td>"
						                	+""+JsonList[re].khachHang.tenKhachHang+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].laiSuat.mucLaiSuat+""
										+"</td>"
						                +"<td>"
						                	+""+JsonList[re].dongTienLai.soTienDong+""
						                +"</td>"
						                 +"<td>"
						                	+""+JsonList[re].taiSan.tenTaiSan+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].ngayCam+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].ngayTra+""
						                +"</td>"
						                var tinhTrang="";
						                if (JsonList[re].tinhTrang==0) {
						                	tinhTrang="Chưa hết hạn";
										} else {
											tinhTrang="Hết hạn";
										}
						                +"<td>"
						                	+""+tinhTrang+""
						                +"</td>"
			                    	+"</tr>"
							}
					}else{
						rs="";
					}
					
					//phân trang
					var showPage="";
					for ( var p in JsonPages) {
						showPage+= "<li class=\"paginate_button previous disabled\" aria-controls=\"dataTables-example\" tabindex=\"0\" id=\"dataTables-example_previous\">"
                       				 	+"<a href=\"#\">Previous</a>"
                       				+"</li>"
									+"<li class=\"paginate_button active\" aria-controls=\"dataTables-example\" tabindex=\"0\">"
										+"<a href=\"#\">"+JsonPages[p]+"</a>"
                        			+"</li>"
                       				+"<li class=\"paginate_button next\" aria-controls=\"dataTables-example\" tabindex=\"0\" id=\"dataTables-example_next\">"
                    					+"<a href=\"#\">Next</a>"
                    				+"</li>"
					}
                    
                  //hien thi table danh sach
			 	   $('#showall tbody').html(rs);
	              
             		//hien thi phân trang
             		$('#showPaging').html(showPage);
             		
                    //hien thi thong tin
	                $('#showInfo').html(info);
				},
				error: function(e){
					alert('loi '+e);
                }
			});
		
    	}
    	
    	//su kien lay data
//     	$(function(){
//     		setTimeout(function(){
//     			loadDataAjax();
//     		}, 10000);//1 giay
//     	});
    	
    </script>
    
    <!-- end ajax -->
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="menu.jsp"></jsp:include>
        <!-- end Navigation -->

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Hệ thống <small>Quản lý cửa hiệu cầm đồ</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

               <!-- col-lg-3 col-md-6 -->
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-list fa-fw"></i> Hợp đồng sắp hết hạn</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped" id="showall">
                                        <thead>
                                            <tr>
                                                <th>Mã CTHD</th>
                                                <th>Tên khách hàng</th>
                                                <th>Mức lãi suất</th>
                                                <th>Số tiền đóng lãi</th>
                                                <th>Tên tài sản</th>
                                                <th>Ngày cầm</th>
                                                <th>Ngày trả</th>
                                                <th>Tình trạng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<logic:present name="formThongKe" property="listHDHH">
	                                           <logic:iterate name="formThongKe" property="listHDHH" id="hd">
	                                               <tr>
	    												<th>
														   <bean:write name="hd" property="maCTHD"/>
														</th>
														<td>
														   <bean:define id="tenKhachHang" name="hd" property="khachHang.tenKhachHang"/>
														    <bean:write name="tenKhachHang"/>
														 </td>
														  <td>
														    <bean:define id="mucLaiSuat" name="hd" property="laiSuat.mucLaiSuat"/>
														    <bean:write name="mucLaiSuat"/>
														  </td>
														   <td>
														      <bean:define id="soTienDong" name="hd" property="dongTienLai.soTienDong"/>
														    	<bean:write name="soTienDong"/>
															</td>
															<td>
														      <bean:define id="tenTaiSan" name="hd" property="taiSan.tenTaiSan"/>
														    	<bean:write name="tenTaiSan"/>
															</td>
															<td>
														      <bean:write name="hd" property="ngayCam"/>
															</td>
															<td>
														      <bean:write name="hd" property="ngayTra"/>
															</td>
															<td>
														      <bean:write name="hd" property="tinhTrang"/>
															</td>      		
	                                                	</tr>
	                                            </logic:iterate>
	                                        </logic:present>
                                        </tbody>
                                    </table>
                                </div>
                               <!--  end table hop dong sắp hết han -->
                                       <div class="row">
                                           <div class="col-sm-3"></div>
                                            <div class="col-sm-6"></div>
                                           <div class="col-sm-3">
                                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                                <ul class="pagination" id="showPaging">
                  											<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                                                <a href="#">Previous</a></li>
                                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
                                                              <logic:present name="formThongKe" property="pages">
                                                              	<logic:iterate name="formThongKe" property="pages" id="a">
																	<html:link action="/thong-ke.do?action=hopdonghethan" paramName="a" paramId="page">
																		<bean:write name="a" />
																	</html:link>
																</logic:iterate>
                                                              </logic:present>
                                                              </li>
                                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                                            <a href="#">Next</a></li>                                 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                               </div>
                        </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
		</div>
        </div>
       </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>

</html>