package lk.ijse.ecommercewebapp.config;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lk.ijse.ecommercewebapp.entity.Category;
import lk.ijse.ecommercewebapp.entity.Product;
import lk.ijse.ecommercewebapp.entity.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@WebListener
public class SessionFactoryConfig implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SessionFactory sessionFactory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Product.class)
                .addAnnotatedClass(Category.class)
                .buildSessionFactory();

        System.out.println("Session Factory is created");

        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("sessionFactory", sessionFactory);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        try {
            servletContext.removeAttribute("sessionFactory");
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("Session Factory is destroyed");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
