<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.Brands" %>
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
        <div class="col-6 mx-auto">
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Item Added Successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <form action="/apply" method="post">
                <div class="row mt-3">
                    <div class="col-12">
                        <label>NAME :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_name" required>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Price :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_price" required>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>AMOUNT :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_amount" required>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Brand :</label>
                    </div>
                </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <select class="form-control" name="brand_id" >
                                <%
                                    ArrayList<Brands> brands = (ArrayList<Brands>) request.getAttribute("brands");
                                    if (brands!=null){
                                        for (Brands br : brands){
                                %>
                                <option value="<%=br.getId()%>">
                                    <%=br.getName()+" - "+br.getCountryName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-success">ADD Item</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>
