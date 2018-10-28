
<%@page import="DatabaseProcess.Session"%>
<%@page import="DatabaseProcess.ReadFile"%>

       
<!DOCTYPE html>
<html>
    <head>
        <title>Result</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/profil.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
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
                            <li class="active"><a href="home.jsp">Konversi <span class="sr-only">(current)</span></a></li>
                            <!-- <li><a href="profil.html">Profil</a></li> -->
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="login.jsp">Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <div class="row">

            <div class="container">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Result...</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="gambar/sukses.jpg" class="img-circle img-responsive"> </div>
                                <div class=" col-md-9 col-lg-9 "> 
                                    <% ReadFile a = new ReadFile();
                                        String readResult = a.fileToStringResult(Session.getFileName());
                                        String readInput = a.fileToStringInput(Session.getFileName());
                                        String readSchema = a.fileToStringSchema(Session.getFileName());
                                    %>
                                    <textarea style="font-size:14px" class="form-control" name="text" rows="12" cols="90">
                                        <%= readResult%>
                                    </textarea>
                                    <br>
<!--                                        <a href="#" class="btn btn-primary">Unduh File</a>-->
                                        <form action="DownloadFile" method="post">
                                            <input type="hidden" name="fileName" value="<%= Session.getFileName()%>">
                                            <button class="btn btn-primary" type="submit">Unduh File</button>
                                            <button type="button" class="btn btn-info" id="myBtn">Detail</button>
<!--                                            <button type="button" class="btn btn-warning" id="myBtn1">Bu Chanifah</button>-->
                                        </form>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
            <?html } ?>
        </div><br><br>



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
        
        <style>
            .modal-body {
                max-height: 800px;
            }
        </style>
        

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog" style="width: 99%">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Detail Konversi</h4>
                    </div>
                    <div class="modal-body" >
                        
                      
                    <div class="row">
                        <div class="col-md-12">  
                            <div class="col-md-3 col-lg-3">
                                <div class="panel panel-info ">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">JSON File</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px"  class="form-control" name="text" rows="16" cols="50" readonly>
                                            <%= readInput%>
                                        </textarea>
                                    </div>
                                </div>    
                            </div>
<!--                            <div class="col-md-4 col-lg-4">              
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">JSON Schema</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px"  class="form-control" name="text" rows="8" cols="50">
                                            <%= readSchema%>
                                        </textarea>
                                    </div>
                                </div>
                            </div>-->
                            <div class="col-md-3 col-lg-3">              
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">List Generate JSON</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px"  class="form-control" name="text" rows="16" cols="50" readonly>
                                            <%= Session.getListOfJson()%>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">              
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">OWL Ontology</h3>
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="font-size:12px" class="form-control" name="text" rows="16" cols="90" readonly>
                                            <%= Session.getResultProcess()%>
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
                                        
                                        <!-- Modal -->
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
                                            <%= readInput%>
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
                                            <%= readResult%>
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
