package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.Category;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/pages/category")
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Category> categoryList = session.createQuery("FROM Category", Category.class).list();
            session.close();

            if (categoryList.isEmpty()) {
                resp.sendRedirect("admin.jsp");
                return;
            }

            req.setAttribute("categoryList", categoryList);
            req.getRequestDispatcher("admin.jsp").forward(req, resp);

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");

        System.out.println("categoryName = " + categoryName);

        try {
            Category category = new Category();
            category.setName(categoryName);

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(category);
            session.getTransaction().commit();
            session.close();

            resp.sendRedirect("admin.jsp?status=success&alert=Category Saved Successfully!");
        } catch (HibernateException e) {
            resp.sendRedirect("admin.jsp?status=failed&alert=Category Not Saved!");
            throw new RuntimeException(e);
        }
    }
}
