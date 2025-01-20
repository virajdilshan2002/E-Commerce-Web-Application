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
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
                    resp.sendRedirect("admin.jsp?sysError=Something wrong in our end!");
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
            product.setPrice(Double.parseDouble(price));
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

            resp.sendRedirect("admin.jsp?status=success&alert=Product Saved Successfully!");
        } catch (Exception e) {
            resp.sendRedirect("admin.jsp?status=failed&alert=Product Not Saved!");
            e.printStackTrace();
        }
    }
}
