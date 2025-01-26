package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Order;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/pages/orders")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = (User) req.getServletContext().getAttribute("user");
            if (user == null) {
                resp.sendRedirect("logout?alert=Please login first!");
                return;
            }

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Order> orderList = session.createQuery("FROM Order WHERE user = :user", Order.class)
                    .setParameter("user", user)
                    .list();

            session.close();

            if (orderList.isEmpty()) {
                req.getRequestDispatcher("orders.jsp?alert=You have not placed any orders!").forward(req, resp);
                return;
            }

            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher("orders.jsp?Orders Found").forward(req, resp);
        } catch (HibernateException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
