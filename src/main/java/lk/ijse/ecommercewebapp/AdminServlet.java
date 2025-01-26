package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Category;
import lk.ijse.ecommercewebapp.entity.Product;
import lk.ijse.ecommercewebapp.entity.User;
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
            User user = (User) req.getServletContext().getAttribute("user");
            if (user == null) {
                resp.sendRedirect("logout?alert=Please login first!");
                return;
            }

            String alert = req.getParameter("alert");
            String error = req.getParameter("error");

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Product> productList = session.createQuery("FROM Product", Product.class).list();
            List<Category> catList = session.createQuery("FROM Category", Category.class).list();
            session.close();

            req.setAttribute("productList", productList);
            req.setAttribute("catList", catList);

            if (error != null) {
                req.getRequestDispatcher("admin.jsp?alert=" + error).forward(req, resp);
                return;
            } else if (alert != null) {
                req.getRequestDispatcher("admin.jsp?alert=" + alert).forward(req, resp);
                return;
            }
            req.getRequestDispatcher("admin.jsp").forward(req, resp);
        } catch (HibernateException | IOException e) {
            resp.sendRedirect("admin.jsp");
            throw new RuntimeException(e);
        }
    }
}
