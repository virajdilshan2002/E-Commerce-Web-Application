package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;

@WebServlet(name = "registerServlet", value = "/pages/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        String encodedPassword = new BCryptPasswordEncoder().encode(password);

        User user = new User(name, encodedPassword, role,true);

        System.out.println(user);

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            session.close();

            if (role.equals("ADMIN")) {
                resp.sendRedirect("admin?alert=Admin Registration Successful!");
                resp.setStatus(HttpServletResponse.SC_OK);
                return;
            }

            resp.sendRedirect("../index.jsp?alert=Registration Successful!");
            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            resp.sendRedirect("../index.jsp?alert=Registration Failed! Try Again.");
            resp.getWriter().println(e.getMessage());
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            e.printStackTrace();
        }
    }
}
