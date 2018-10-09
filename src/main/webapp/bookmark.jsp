<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Connection.Koneksi"%>
<%@page import="java.sql.Connection"%>
<%@page import="DatabaseProcess.Session"%>
<!DOCTYPE html>
<html>
<head>
	<title>Bookmark</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
    <% String querySql = "SELECT * FROM bookmark WHERE user_id = '"+Session.getUser_id()+"' ";
        java.sql.Connection conn = (Connection) Koneksi.configDB(); 
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(querySql);
    %>
        
	<div class="col-md-12">
		<div class="row">
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="#">Logo</a>
				    </div>

				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
				      <ul class="nav navbar-nav">
				        <li class="#"><a href="home_l.jsp">Konversi <span class="sr-only">(current)</span></a></li>
				        <li class="active"><a href="profile.jsp">Profile</a></li>
				      </ul>
				      <ul class="nav navbar-nav navbar-right">
				        <li><a href="login.jsp">Logout</a></li>
				      </ul>
				    </div>
				  </div>
				</nav>
		</div>
		<div class="">
			<div class="panel panel-primary">
			  <div class="panel-heading">
			    <h3 class="panel-title">Bookmark konversi file json ke OWL Ontology</h3>
			  </div>
			  <div class="panel-body">
			    <div class="table-responsive" id="data_aktivitas">
                                <table class="table table-striped custab" id="tabel">
                                <thead>
                                    <tr>
                                        <th class="text-center">No</th>
                                        <th >Nama File</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="data">
                                    <% 
                                       int i = 1;
                                        while (rs.next()) { 
                                    
                                    %>
                                    <tr>
                                        <td class="text-center"><%= i++ %></td>
                                        <td><%= rs.getString("bookmark_file") %></td>				           
                                        <td class="text-center">
<!--                                            <button type="button" class="btn btn-info"><div class="glyphicon glyphicon-download"></div> </button>
                                            <a href="DownloadFile">download</a>-->
                                            <form action="DownloadFile" method="post">
                                                 <input type="hidden" name="fileName" value="<%= rs.getString("bookmark_file") %>">
                                                <button class="btn btn-info" type="submit"><div class="glyphicon glyphicon-download"></button>
                                            </form>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>		            
                                </table>	  
                            </div>
			  </div>
			</div><br><br>
		</div>
		<div class="row">
		<div class="row">
			<div class="col-md-8">
				<blockquote class="responsive">
				  <p><i>"Apabila amanah disia-siakan maka tunggulah saat kehancurannya."</p>
				  </i><small>HR. Imam Bukhari<cite title="Source Title"></cite></small>
				</blockquote>
			</div>
		</div>
	</div>
	</div>
	
</body>
</html>