package lk.ijse.ecommercewebapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommercewebapp.entity.Category;
import lk.ijse.ecommercewebapp.entity.Product;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)

@WebServlet(name = "SaveProductServlet", value = "/pages/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            List<Product> productList = session.createQuery("FROM Product", Product.class).list();
            session.close();

            if (productList.isEmpty()) {
                resp.sendRedirect("products.jsp");
                return;
            }

            // Check if the request is for JSON
            String isAjaxRequest = req.getParameter("ajax");
            if ("true".equalsIgnoreCase(isAjaxRequest)) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");

                String type = req.getParameter("type");
                if (type.equals("count")){
                    JsonObjectBuilder obj = Json.createObjectBuilder();
                    obj.add("count", productList.size());
                    resp.getWriter().write(obj.build().toString());
                    return;
                }
                return;
            }

            req.setAttribute("productList", productList);
            req.getRequestDispatcher("products.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("products.jsp");
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = (User) req.getServletContext().getAttribute("user");
            if (user == null) {
                resp.sendRedirect("logout?alert=Please login first!");
                return;
            }

            String action = req.getParameter("action");
            if (action.equals("put")){
                doPut(req, resp);
                return;
            }

            String name = req.getParameter("name");
            String description = req.getParameter("description");
            String price = req.getParameter("price");
            String quantity = req.getParameter("qty");
            String catId = req.getParameter("productCategory");

            Part filePart = req.getPart("image");
            String imageFileName = filePart.getSubmittedFileName();

            String uploadDir = "C:\\Users\\asus\\Desktop\\JavaEE\\Assignments\\E-Commerce Web Application\\src\\main\\webapp\\assets\\images";
            File uploadDirectory = new File(uploadDir);

            if (!uploadDirectory.exists()) {
                if (!uploadDirectory.mkdirs()) {
                    resp.sendRedirect("admin?sysError=Something wrong in our end!");
                    return;
                }
            }

            File imageFile = new File(uploadDir + File.separator + imageFileName);
            try (InputStream inputStream = filePart.getInputStream()) {
                Files.copy(inputStream, imageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(BigDecimal.valueOf(Double.parseDouble(price)));
            product.setQuantity(Integer.parseInt(quantity));
            product.setImageUrl("assets/images/" + imageFileName);

            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            Category category = session.get(Category.class, Long.parseLong(catId));
            product.setCategory(category);
            session.save(product);
            session.getTransaction().commit();
            session.close();

            resp.sendRedirect("admin?alert=Product Saved Successfully!");
        } catch (Exception e) {
            resp.sendRedirect("admin?alert=Product Not Saved!");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String productId = req.getParameter("productId");
            String qty = req.getParameter("qty");
            SessionFactory sessionFactory = (SessionFactory) req.getServletContext().getAttribute("sessionFactory");
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Product product = session.get(Product.class, Long.parseLong(productId));
            product.setQuantity(product.getQuantity() + Integer.parseInt(qty));
            session.update(product);
            session.getTransaction().commit();
            session.close();
            resp.sendRedirect("admin?alert=Qty Added Successfully!");
        } catch (HibernateException e) {
            resp.sendRedirect("admin?alert=Qty Not Added!");
            throw new RuntimeException(e);
        }
    }

}
