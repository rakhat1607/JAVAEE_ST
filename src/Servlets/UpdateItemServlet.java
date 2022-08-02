package Servlets;

import DB.Brands;
import DB.DBUtil;
import DB.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String redirect = "/";

        String name = request.getParameter("item_name");
        double price = Double.parseDouble(request.getParameter("item_price"));
        int amount = Integer.parseInt(request.getParameter("item_amount"));
        Long id = Long.parseLong(request.getParameter("user_id"));
        Long brandId = Long.parseLong(request.getParameter("brand_id"));

        Brands brand = DBUtil.getBrand(brandId);
       Item item = DBUtil.getItem(id);
       if (item!=null){
            item.setName(name);
            item.setPrice(price);
            item.setAmount(amount);
            item.setBrand(brand);

            DBUtil.updateUtil(item);
            redirect = "/details?id="+id+"&success";
       }
       response.sendRedirect(redirect);
    }
}
