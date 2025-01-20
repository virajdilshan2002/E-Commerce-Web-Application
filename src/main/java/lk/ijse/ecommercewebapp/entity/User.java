package lk.ijse.ecommercewebapp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data

@Entity
@Table(name = "user")
public class User {
    @Id
    @Column(name = "username")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "role")
    private String role;

    @Column(name = "status")
    private boolean status;
}
