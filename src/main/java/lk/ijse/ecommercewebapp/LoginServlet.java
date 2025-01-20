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

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    public static User user;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            user = session.get(User.class, username);

            if (user == null){
                resp.getWriter().print("User is null!");
                resp.sendRedirect("index.jsp?message=Couldn't Find User! Please Register!");
                return;
            } else if (!new BCryptPasswordEncoder().matches(password, user.getPassword())){
                resp.getWriter().print("Invalid username or password!");
                resp.sendRedirect("index.jsp?message=Invalid username or password!");
                return;
            }

            resp.getWriter().print("Login Success!");
            if (user.getRole().equals("admin")){
                resp.sendRedirect("pages/admin.jsp?");
                return;
            }
            resp.sendRedirect("pages/home.jsp?");
        } catch (Exception e) {
            resp.getWriter().print(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
