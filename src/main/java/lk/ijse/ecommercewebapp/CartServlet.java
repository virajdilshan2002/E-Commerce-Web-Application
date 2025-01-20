package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Cart;
import lk.ijse.ecommercewebapp.entity.Category;
import lk.ijse.ecommercewebapp.entity.Product;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static lk.ijse.ecommercewebapp.LoginServlet.user;

@WebServlet(name = "CartServlet", value = "/pages/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String qty = req.getParameter("qty");

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            Product product = session.get(Product.class, Long.parseLong(productId));

            if (product == null) {
                resp.sendRedirect("products.jsp?alert=Product not found!");
            }
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setUser(user);
            cart.setQty(Integer.parseInt(qty));
            cart.setTotal(product.getPrice() * Integer.parseInt(qty));

            session.save(cart);
            session.getTransaction().commit();
            session.close();
            resp.sendRedirect("products.jsp?alert=Product added to cart!");
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }
}
