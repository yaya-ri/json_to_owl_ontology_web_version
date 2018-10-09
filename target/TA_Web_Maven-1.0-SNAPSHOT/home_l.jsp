
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
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
                                <li class="active"><a href="home_l.jsp">Konversi <span class="sr-only">(current)</span></a></li>
                                <li class=""><a href="profile.jsp">Profil</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="login.jsp">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <div class="col-md-12"><h1>Konversi Json to OWL ontology</h1></div>
                        <div class="col-md-12">
                            <p>Aplikasi yang dibuat dengan tujuan memanfaatkan data json lalu melakukan konversi menjadi sebuah data OWL Ontology, dimana akan memudahkan developer semantic web dalam membangun sebuah web semantik</p></div>
                        <br><br><br><br><br><br>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col">
                    <form class="form-horizontal" method="POST" action="ProsesKonversi" method="POST" enctype="multipart/form-data" >
                        <fieldset>
                            <div class="form-group">
                                <div class="col-md-8 col-md-offset-5 col">
                                   <input placeholder="cari" type="file" name="jsonData" accept=".json" >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-4 col">
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">konversi</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div><br>
        </div>
        <br><br>
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