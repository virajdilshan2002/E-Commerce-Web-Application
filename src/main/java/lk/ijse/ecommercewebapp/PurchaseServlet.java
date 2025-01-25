package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Cart;
import lk.ijse.ecommercewebapp.entity.Order;
import lk.ijse.ecommercewebapp.entity.OrderDetail;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "PurchaseServlet", value = "/pages/purchase")
public class PurchaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
        Session session = sessionFactory.openSession();
        List<Order> orderList = session.createQuery("FROM Order", Order.class).list();

        // Check if the request is for JSON
        String isAjaxRequest = req.getParameter("ajax");
        if ("true".equalsIgnoreCase(isAjaxRequest)) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            String type = req.getParameter("type");
            if (type.equals("count")){
                JsonObjectBuilder obj = Json.createObjectBuilder();
                obj.add("count", orderList.size());
                resp.getWriter().write(obj.build().toString());
                return;
            }
            return;
        }

        req.setAttribute("orderList", orderList);
        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getServletContext().getAttribute("user");
        String netTotal = req.getParameter("netTotal");
        BigDecimal netTotalBigDecimal = new BigDecimal(netTotal);
        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Cart> cartList = session.createQuery("FROM Cart c WHERE c.user = :user", Cart.class)
                    .setParameter("user", user)
                    .list();


            Order order = new Order();
            order.setUser(user);
            order.setTotal(netTotalBigDecimal);
            Transaction transaction = null;
            try {
                transaction = session.beginTransaction();
                session.save(order);

                for (Cart cart : cartList){
                    OrderDetail od =new OrderDetail();
                    od.setQty(cart.getQty());
                    od.setTotal(cart.getTotal());
                    od.setOrder(order);
                    od.setProduct(cart.getProduct());

                    session.save(od);
                    session.remove(cart);
                }

                transaction.commit();
            } catch (Exception e) {
                transaction.rollback();
                session.close();
                resp.sendRedirect("cart?alert=Order Not Placed!");
                throw new RuntimeException(e);
            }
            session.close();
            resp.sendRedirect("cart?alert=Order Placed Successfully!");
        } catch (Exception e) {
            resp.sendRedirect("cart?alert=Order Not Placed!");
            throw new RuntimeException(e);
        }
    }
}
