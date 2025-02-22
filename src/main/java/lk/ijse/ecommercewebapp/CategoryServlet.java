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

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/pages/category" )
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Category> categoryList = session.createQuery("FROM Category", Category.class).list();
            session.close();

            if (categoryList.isEmpty()) {
                resp.getWriter().print("[]");
                return;
            }

            JsonArrayBuilder categoryBuilder = Json.createArrayBuilder();
            for (Category category : categoryList) {
                categoryBuilder.add(Json.createObjectBuilder()
                        .add("id", category.getId())
                        .add("name", category.getName())
                        .build()
                );
            }
            JsonObjectBuilder response = Json.createObjectBuilder();
            response.add("data", categoryBuilder);
            resp.setContentType("application/json");
            resp.getWriter().print(response.build());
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");

        try {
            Category category = new Category();
            category.setName(categoryName);

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(category);
            session.getTransaction().commit();
            session.close();

            resp.sendRedirect("admin?alert=Category Saved Successfully!");
        } catch (HibernateException e) {
            resp.sendRedirect("admin?error=Category Not Saved!");
            throw new RuntimeException(e);
        }
    }
}
