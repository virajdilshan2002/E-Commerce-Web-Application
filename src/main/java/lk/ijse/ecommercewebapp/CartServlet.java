package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Cart;
import lk.ijse.ecommercewebapp.entity.Product;
import lk.ijse.ecommercewebapp.entity.User;
import lk.ijse.ecommercewebapp.tablemodal.CartTableModal;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/pages/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = (User) req.getServletContext().getAttribute("user");
            if (user == null) {
                resp.sendRedirect("logout?alert=Please login to view cart!");
                return;
            }

            String alert = req.getParameter("alert");
            req.setAttribute("alert", alert);

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Cart> cartList = session.createQuery("FROM Cart WHERE user = :user", Cart.class)
                    .setParameter("user", user)
                    .list();
            session.close();

            if (cartList.isEmpty()) {
                req.getRequestDispatcher("cart.jsp").forward(req, resp);
                return;
            }

            List<CartTableModal> tableModalList = new ArrayList<>();
            for (Cart cart : cartList) {
                CartTableModal cartTm = new CartTableModal(
                        cart.getId(),
                        cart.getProduct(),
                        cart.getProduct().getPrice(),
                        cart.getQty(),
                        cart.getTotal()
                );

                tableModalList.add(cartTm);
            }

            req.setAttribute("cartList", tableModalList);
            req.getRequestDispatcher("cart.jsp").forward(req, resp);

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getServletContext().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("logout?alert=Please login to view cart!");
            return;
        }

        String action = req.getParameter("action");
        if (action.equals("delete")){
            doDelete(req, resp);
            return;
        }

        String productId = req.getParameter("productId");
        String qty = req.getParameter("qty");

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            Product product = session.get(Product.class, Long.parseLong(productId));
            product.setQuantity(product.getQuantity() - Integer.parseInt(qty));

            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setUser(user);
            cart.setQty(Integer.parseInt(qty));
            cart.setTotal(product.getPrice().multiply(new java.math.BigDecimal(qty)));

            session.save(cart);
            session.update(product);
            session.getTransaction().commit();
            session.close();


            resp.sendRedirect("products?alert=Product added to cart!");
        } catch (HibernateException e) {
            resp.sendRedirect("products?alert=Failed to add product to cart!");
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cartId = req.getParameter("cartId");

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.createQuery("DELETE FROM Cart WHERE id = :id")
                    .setParameter("id", Long.parseLong(cartId))
                    .executeUpdate();
            session.getTransaction().commit();
            session.close();
            resp.sendRedirect("cart?alert=Product removed from cart!");
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }
}
