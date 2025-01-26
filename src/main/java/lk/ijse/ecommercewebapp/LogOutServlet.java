package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LogOutServlet", value = "/pages/logout")
public class LogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getServletContext().removeAttribute("user");

        String alert = req.getParameter("alert");
        if (alert != null) {
            resp.sendRedirect("../index.jsp?alert=" + alert);
            return;
        }
        resp.sendRedirect("../index.jsp");
    }
}
