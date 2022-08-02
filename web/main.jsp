<%@ page import="DB.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/">BITLAB SHOP</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link " href="/">ALL ITEMS</a>
                            </li>
                            <li  class="nav-item">
                                <a class="nav-link" href="/additem">ADD ITEMS</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row mt-3">
        <div class="col-10 mx-auto">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>AMOUNT</th>
                    <th>Brand</th>
                    <th style="width: 10%">DETAILS</th>
                </tr>
                </thead>
                <tbody>

                    <%
                        ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("gadjet");
                        for (Item itm : items) {
                            

                    %>
                        <tr>
                            <td><%=itm.getId()%></td>
                            <td><%=itm.getName()%></td>
                            <td><%=itm.getPrice()%></td>
                            <td><%=itm.getAmount()%></td>
                            <td><%=itm.getBrand().getName() + " / "+itm.getBrand().getCountryName()%></td>
                            <td><a href="/details?id=<%=itm.getId()%>" class="btn btn-dark btn-sm">DETAILS</a></td>
                        </tr>

                    <%
                        }

                    %>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
