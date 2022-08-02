package Servlets;

import DB.Brands;
import DB.DBUtil;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/additem")
public class AddItem extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Brands> brands = DBUtil.getAllBrands();
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("/additem.jsp").forward(request, response);
    }}
