package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Product;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/pages/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Product> productList = session.createQuery("FROM Product", Product.class).list();
            session.close();

            req.setAttribute("productList", productList);
            req.getRequestDispatcher("admin.jsp").forward(req, resp);
        } catch (HibernateException | IOException e) {
            resp.sendRedirect("admin.jsp");
            throw new RuntimeException(e);
        }
    }
}
