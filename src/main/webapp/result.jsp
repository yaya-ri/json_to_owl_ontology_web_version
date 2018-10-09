
<%@page import="DatabaseProcess.Session"%>
<%@page import="DatabaseProcess.ReadFile"%>

       
<!DOCTYPE html>
<html>
    <head>
        <title>Result</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/profil.css">
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
                                        String read = a.fileToString(Session.getFileName());
                                    %>
                                    <textarea class="form-control" name="text" rows="12" cols="90">
                                        <%= read%>
                                    </textarea>
                                    <br>
<!--                                        <a href="#" class="btn btn-primary">Unduh File</a>-->
                                        <form action="DownloadFile" method="post">
                                            <input type="hidden" name="fileName" value="<%= Session.getFileName()%>">
                                            <button class="btn btn-primary" type="submit">Unduh File</button>
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

    </body>
</html>
