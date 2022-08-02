<%@ page import="DB.Item" %>
<%@ page import="DB.Brands" %>
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
        <div class="col-6 mx-auto">
            <%
                Item item = (Item)request.getAttribute("item");
                if(item!=null){
            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Item UPdated Successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <form action="/update" method="post">
                <input type="hidden" name="user_id" value="<%=item.getId()%>">
                <div class="row mt-3">
                    <div class="col-12">
                        <label>NAME :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_name" required value="<%=item.getName()%>">
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Price :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_price" required value="<%=item.getPrice()%>">
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>AMOUNT :</label>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <input type="text" class="form-control" name="item_amount" required value="<%=item.getAmount()%>">
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
                        <select class="form-select" name="brand_id">
                            <%
                                ArrayList<Brands> brands = (ArrayList<Brands>) request.getAttribute("brands");
                                if(brands!=null){
                                    for(Brands brs : brands){
                            %>
                            <option value="<%=brs.getId()%>">
                                <%=brs.getName() + " - " + brs.getCountryName()%>
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
                        <button class="btn btn-success">UPDATE Item</button>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteItemModal">DELETE Item</button>
                    </div>
                </div>
            </form>
            <div class="modal fade" id="deleteItemModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete" method="post">
                            <input type="hidden" name="id" value="<%=item.getId()%>">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Confirm Delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            <button  class="btn btn-danger">Yes</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>


            <%
                }
            %>
        </div>
    </div>

</div>
</body>
</html>
