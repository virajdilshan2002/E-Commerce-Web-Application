package lk.ijse.ecommercewebapp;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class Test {
    public static void main(String[] args) {
        /*String pw = "viraj2002";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encoded = passwordEncoder.encode(pw);

        System.out.println("pw= "+pw);
        System.out.println("Encoded pw= "+encoded);

        boolean matches = passwordEncoder.matches(pw, encoded);
        System.out.println("Matches= "+matches);*/

        String uploadDir = "C:\\Users\\asus\\Desktop\\JavaEE\\Assignments\\E-Commerce Web Application\\src\\main\\webapp\\assets\\images";
        File uploadDirectory = new File(uploadDir);
        System.out.println("Upload Directory: " + uploadDirectory.exists());
        if (!uploadDirectory.exists()) {
            if (!uploadDirectory.mkdirs()) {
                System.out.println("not created");
            }
            System.out.println("created");
        }

    }
}
