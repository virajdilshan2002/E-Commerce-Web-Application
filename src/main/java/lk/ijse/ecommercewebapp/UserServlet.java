package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/pages/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<User> userList = session.createQuery("FROM User").list();
            session.close();

            // Check if the request is for JSON
            String isAjaxRequest = req.getParameter("ajax");
            if ("true".equalsIgnoreCase(isAjaxRequest)) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");

                String type = req.getParameter("type");
                if (type.equals("count")){
                    JsonObjectBuilder obj = Json.createObjectBuilder();
                    obj.add("count", userList.size());
                    resp.getWriter().write(obj.build().toString());
                    return;
                }
                return;
            }

            req.setAttribute("userList", userList);
            req.getRequestDispatcher("admin.jsp").forward(req, resp);

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }


}
