package login.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductCardController {
    @GetMapping("product-card")
    public String getProductCard() {
        return "product-card";
    }
    
}
