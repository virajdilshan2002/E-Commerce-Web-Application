package lk.ijse.ecommercewebapp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "username")
    private User user;

    @CreationTimestamp
    @Column(name = "order_date_time")
    private Timestamp orderDateTime;

    @Column(name = "total")
    private BigDecimal total;
}
