<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
        
     <!-- jQuery -->
    <script src="js/jquery-3.1.1.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
    <title>Admin - Quản lý cửa tiệm cầm đồ</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom CSS -->
    <link href="css/vinh.css" rel="stylesheet">


    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="menu.jsp"></jsp:include>
        <!-- end Navigation -->
		
	 	<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <!-- <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Hệ thống <small>Quản lý hợp đồng</small>
                        </h1>
                    </div>
                </div> -->
                <!-- /.row -->

               <!-- col-lg-3 col-md-6 -->
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-fw fa-table"></i> Quản lý chi tiết hợp đồng</h3>
                            </div>
                            <div class="panel-body">
                                <!-- <div id="morris-area-chart"></div> -->

                                <div class="row">
                                	<!-- thông tin -->
                                    <div class="col-sm-12">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-info"></i> Thông tin</h3>
                                            </div>
                                            <div class="panel-body">
                                                <!-- body -->
                                               <html:form action="/themChiTietHopDong" acceptCharset="UTF-8" styleClass="form-horizontal" 
                                              		 	enctype="multipart/form-data">
												  <div class="row">
												  <!-- tài sản -->
												  	<div class="col-sm-6">
												  		<div class="panel panel-warning">
												  			<div class="panel-heading">
				                                                <h3 class="panel-title"><i class="fa fa-asset"></i> Tài sản</h3>
				                                            </div>
				                                            <div class="panel-body">
				                                            	<div class="form-group">
																    <label class="control-label col-sm-4">Chọn danh mục:</label>
																    <div class="col-sm-8">
																      <html:select styleClass="form-control" property="maDanhMuc">
																			<option value="">-- Chọn danh mục:</option>
																			<html:optionsCollection name="chiTietHopDongForm" property="listDanhMuc" label="tenLoaiTaiSan" value="maLoaiTaiSan"/>
																		</html:select>
																    </div>
																  </div>
																  <div class="form-group">
																    <label class="control-label col-sm-4">Tên tài sản:</label>
																    <div class="col-sm-8"> 
																      <html:text property="tenTaiSan" styleClass="form-control"></html:text>
																    </div>
																  </div>
																  <div class="form-group">
																    <label class="control-label col-sm-4">Mô tả:</label>
																    <div class="col-sm-8">
																      <html:textarea property="moTaTaiSan" styleClass="form-control"></html:textarea>
																    </div>
																  </div>
																  <div class="form-group">
																    <label class="control-label col-sm-4">Hình ảnh:</label>
																    <div class="col-sm-8"> 
																      <html:file property="file" styleClass="form-control"></html:file>
																    </div>
																  </div>
				                                            </div>
												  		</div>
												  	</div>
												  	
												  	<!-- hợp đồng -->
												  	<div class="col-sm-6">
												  		<div class="panel panel-warning">
												  			<div class="panel-heading">
				                                                <h3 class="panel-title"><i class="fa fa-fw fa-table"></i> Hợp đồng</h3>
				                                            </div>
				                                            <div class="panel-body">
				                                            	<div class="form-group">
																    <label class="control-label col-sm-4">Giá cầm (1000đ):</label>
																    <div class="col-sm-8">
																      <html:text property="soTienCam" styleClass="form-control"></html:text>
																    </div>
																  </div>
																  <div class="form-group">
																    <label class="control-label col-sm-4">Hợp đồng đến:</label>
																    <div class="col-sm-8"> 
																      <input type="date" class="form-control" id="a" name="ngayTra" />
																    </div>
																  </div>
																  <div class="form-group">
																    <div class="col-sm-6"> 
																    	<html:submit styleClass="form-control btn-info" property="xemTruoc" value="Xem trước"></html:submit>
																    </div>
																    <div class="col-sm-6"> 
																      <html:submit styleClass="form-control btn-danger" property="datHopDong" value="Đặt hợp đồng"></html:submit>
																    </div>
																  </div>
				                                            </div>
												  		</div>
												  	</div>
												  </div>
												</html:form>
                                                <!-- end body -->
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                    
                                    </div>
                                </div>

                                    <!-- end row -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        
                                    <!-- danh sach hop dong- -->
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-list fa-fw"></i> Danh sách chi tiết hợp đồng</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-striped">
                                                        <thead>
                                                           <tr>
				                                                <th>Mã CTHĐ</th>
																<th>Tên KH</th>
																<th>Địa chỉ</th>
				                                                <th>Tên tài sản</th>
				                                                <th>Mô tả</th>
				                                                <th>Ngày cầm</th>
																<th>Ngày trả</th>
																<th>Số tiền cầm</th>
																<th>Mức lãi suất</th>
																<th>Thanh toán * (1000đ)</th>
																<th> Chi tiết </th>
				                                            </tr>
                                                        </thead>
                                                        <tbody>
				                                            <logic:present name="chiTietHopDongForm" property="listChiTietHopDong">
				                                            	<logic:iterate id="cthd" name="chiTietHopDongForm" property="listChiTietHopDong">
										                            <tr>
										                                <td><bean:write name="cthd" property="maCTHD"></bean:write></td>
										                                <td><bean:write name="cthd" property="khachHang.tenKhachHang"></bean:write></td>
										                                <td><bean:write name="cthd" property="khachHang.diaChi"></bean:write></td>
										                                <td><bean:write name="cthd" property="taiSan.tenTaiSan"></bean:write></td>
																		<td><bean:write name="cthd" property="taiSan.moTa"></bean:write></td>
										                               <td><bean:write 	name="cthd" property="ngayCam"></bean:write></td>
										                                <td><bean:write name="cthd" property="ngayTra"></bean:write></td>
										                                <td><bean:write name="cthd" property="soTienCam"></bean:write></td>
																		<td><bean:write name="cthd" property="laiSuat.mucLaiSuat"></bean:write></td>
																		<td><bean:write name="cthd" property="tienThanhToan"></bean:write></td>
																		<td>
																		 	<bean:define id="maCTHD" name="cthd" property="maCTHD"></bean:define>
																				<%-- <html:link action="/thanhToan?maCTHD=${maCTHD}">
																				<span class="glyphicon glyphicon-plus">Thanh toán</span>
																		 	</html:link> --%>
																		</td>
										                           </tr>
										                          </logic:iterate>
				                                            </logic:present>
				                                        </tbody>
                                                    </table>
                                                </div>
                                               <!--  end danh sach hop dong -->
                                               <div class="row">
                                                   <div class="col-sm-4"></div>
                                                    <div class="col-sm-4">
                                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	                                                        <ul class="pagination">
	                                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                                                                <a href="#">Previous</a></li>
	                                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
	                                                                <a href="#">1</a></li>
	                                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
	                                                                <a href="#">2</a></li>
	                                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
	                                                            <a href="#">Next</a></li>
	                                                        </ul>
                                                    	</div>
                                                    </div>
                                                   <div class="col-sm-4">
                                                </div>
                                            </div>
                                       </div>
                                </div>
                            </div>
                        </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    </div>
    </div>
    </div>
    <!-- /#wrapper -->

</body>

</html>
