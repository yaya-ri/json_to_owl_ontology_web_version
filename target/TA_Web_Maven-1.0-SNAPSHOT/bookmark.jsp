<%@page import="DatabaseProcess.ReadFile"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Connection.Koneksi"%>
<%@page import="java.sql.Connection"%>
<%@page import="DatabaseProcess.Session"%>

<%
    ReadFile a = new ReadFile();
    String readResult=null;
    String readInput=null;
%>

<!DOCTYPE html>
<html>
<head>
	<title>Bookmark</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
//                                        readResult = a.fileToStringResult(rs.getString("bookmark_file"));
//                                        readInput = a.fileToStringInput(rs.getString("bookmark_file"));
                                    
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
                                                <button type="button" class="btn btn-info" id="myBtn1"><div class="glyphicon glyphicon-download"></button>
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
	
                                
    <div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog" style="width: 99%">

            <!-- Modal content-->
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Perbandingan Data JSON Dan OWL Ontology</h4>
                </div>
                <div class="modal-body" >


                    <div class="row">
                        <div class="col-md-12">  
                            <div class="col-md-6 col-lg-6">
                                <div class="panel panel-info ">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">JSON File</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px"  class="form-control" name="text" rows="16" cols="50">
                                            <%= readInput %>
                                        </textarea>
                                    </div>
                                </div>    
                            </div>
                            <div class="col-md-6 col-lg-6">              
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">OWL Ontology</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px" class="form-control" name="text" rows="16" cols="90">
                                            <%= readResult %>
                                        </textarea>
                                    </div>
                                </div> 
                            </div>            
                        </div>       
                    </div>

                </div>
            </div>

        </div>
    </div>


    <script>
    $(document).ready(function(){
        $("#myBtn").click(function(){
            $("#myModal").modal();
        });
    });
    </script>

    <script>
    $(document).ready(function(){
        $("#myBtn1").click(function(){
            $("#myModal1").modal();
        });
    });
    </script>

    <script>
       $('document').ready(function(){
            $('textarea').each(function(){
                $(this).val($(this).val().trim());
                }
            );
        }); 
    </script>                          
</body>
</html>