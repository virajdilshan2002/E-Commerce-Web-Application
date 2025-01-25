package lk.ijse.ecommercewebapp.tablemodal;

import lk.ijse.ecommercewebapp.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class CartTableModal {
    private Long id;
    private Product product;
    private BigDecimal unitPrice;
    private int qty;
    private BigDecimal total;
}
