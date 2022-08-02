package Servlets;


import DB.Brands;
import DB.DBUtil;
import DB.Item;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/apply")
public class ApplyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Hello");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("item_name");
        double price = Double.parseDouble(request.getParameter("item_price"));
        int amount = Integer.parseInt(request.getParameter("item_amount"));
        Long brandId = Long.parseLong(request.getParameter("brand_id"));

        Brands brand = DBUtil.getBrand(brandId);
        if (brand != null) {
            Item item = new Item();
            item.setName(name);
            item.setPrice(price);
            item.setAmount(amount);
            item.setBrand(brand);
            DBUtil.addItem(item);
        }
        response.sendRedirect("/additem?success");

    }
}