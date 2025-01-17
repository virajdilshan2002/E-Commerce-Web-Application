package lk.ijse.ecommercewebapp;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test {
    public static void main(String[] args) {
        String pw = "viraj2002";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encoded = passwordEncoder.encode(pw);

        System.out.println("pw= "+pw);
        System.out.println("Encoded pw= "+encoded);

        boolean matches = passwordEncoder.matches(pw, encoded);
        System.out.println("Matches= "+matches);
    }
}
