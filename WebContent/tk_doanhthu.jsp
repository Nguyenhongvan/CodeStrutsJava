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

    <title>Thống kê- Doanh thu</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

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
                            Thống kê <small>Doanh thu</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

               <!-- col-lg-3 col-md-6 -->
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-fw fa-table"></i> Bạn muốn làm gì ?</h3>
                            </div>
                            <div class="panel-body">
                                <!-- <div id="morris-area-chart"></div> -->

                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Làm gì bây giờ ?</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <html:form action="/thong-ke.do?action=listthanhtoan" method="post">
                                                    	<div class="col-sm-6">
	                                                        <div class="panel panel-green">
	                                                            <div class="panel-heading">
	                                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Chọn năm</h3>
	                                                            </div>
	                                                            <div class="panel-body">
	                                                                <div class="form-group">
	                                                                  <html:select property="nam" value=".. Chọn năm .." styleClass="form-control">
	                                                                		<html:option value="" >.. Chọn năm ..</html:option>
	                                                                		<html:option value="2016">2016</html:option>
	                                                                		<html:option value="2017">2017</html:option>
	                                                                	</html:select>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-sm-6">
	                                                        <div class="panel panel-green">
	                                                            <div class="panel-heading">
	                                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Chọn tháng</h3>
	                                                            </div>
	                                                            <div class="panel-body">
	                                                                <div class="form-group">
	                                                                  <html:select property="thang" styleClass="form-control"  value=".. Chọn tháng ..">
	                                                                  		<html:option value="" >.. Chọn tháng ..</html:option>
	                                                                		<html:option value="1">1</html:option>
	                                                                		<html:option value="2">2</html:option>
	                                                                		<html:option value="3">3</html:option>
	                                                                		<html:option value="4">4</html:option>
	                                                                		<html:option value="5">5</html:option>
	                                                                		<html:option value="6">6</html:option>
	                                                                		<html:option value="7">7</html:option>
	                                                                		<html:option value="8">8</html:option>
	                                                                		<html:option value="9">9</html:option>
	                                                                		<html:option value="10">10</html:option>
	                                                                		<html:option value="11">11</html:option>
	                                                                		<html:option value="12">12</html:option>
	                                                                	</html:select>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="row">
	                                                    	<div class="col-sm-4"></div>
	                                                    	<div class="col-sm-4">
	                                                    		<!-- <div class="col-sm-4"></div> -->
	                                                    		<div><html:submit styleClass="form-control btn btn-primary" value="Thống kê"></html:submit></div>
	                                                    		<!-- <div class="col-sm-4"></div> -->
	                                                    	</div>
	                                                    	<div class="col-sm-4"></div>
	                                                    </div>
                                                    </html:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><i class="fa fa-info-circle"></i> Thông Tin</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row" style="margin-left: 0px;">
                                                        <div class="col-sm-6">
                                                            <div class="row"><label>Tháng : </label></div>
                                                            <div class="row"><label>Năm : </label></div>
                                                            <div class="row"><label>Tổng tiển thanh lý : </label></div>
                                                            <div class="row"><label>Tổng doanh thu : </label></div>
                                                            <div class="row"><label>Tổng tiền thu lãi : </label></div>
                                                            <div class="row"><label>Tổng tiền cầm đồ : </label></div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="row"><label><bean:write name="formThongKe" property="thang"/></label></div>
                                                            <div class="row"><label><bean:write name="formThongKe" property="nam"/></label></div>
                                                            <div class="row"><label> 2.000.000</label></div>
                                                            <div class="row"><label> 50.000.000</label></div>
                                                            <div class="row"><label> 5.000.000</label></div>
                                                            <div class="row"><label> 60.000.000</label></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>

                                    <!-- end row -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        
                                    <!-- hợp đồng sắp hết hạn- -->
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Doanh thu (tháng / năm)</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Tổng doanh thu</th>
                                                                <th>Tổng tiền thanh lí</th>
                                                                <th>Tổng tiền thu lãi</th>
                                                                <th>Tổng tiền cầm đồ</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>2.000.000</td>
                                                                <td>50.000.000</td>
                                                                <td>5.000.000</td>
                                                                <td>60.000.000</td>
                                                            </tr>
                                                            <tr>
                                                                <th  colspan="3" id="a">
                                                                    <span>Tổng tiền lãi</span>
                                                                    <span>=</span>
                                                                    <span>Tổng doanh thu</span>
                                                                    <span>+</span>
                                                                    <span>Tổng tiền thanh lí</span>
                                                                    <span>+</span>
                                                                    <span>Tổng tiền thu lãi</span><span> -</span>
                                                                    <span>Tổng tiền cầm đồ</span>
                                                                </th>
                                                                <td>
                                                                    <div><span><b class="cl_total">117.000.000</b></span></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                               <!--  end table hop dong sắp hết han -->
                                               <div class="row">
                                                   <div class="col-sm-3"></div>
                                                    <div class="col-sm-6"></div>
                                                   <div class="col-sm-3">
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
