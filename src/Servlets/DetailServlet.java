package Servlets;

import DB.Brands;
import DB.DBUtil;
import DB.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.BaseRowSet;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(value = "/details")
public class DetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException,  ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
        Item item   = DBUtil.getItem(id);
        request.setAttribute("item",item);

        ArrayList<Brands> brands = DBUtil.getAllBrands();
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("/details.jsp").forward(request,response);
    }
}
