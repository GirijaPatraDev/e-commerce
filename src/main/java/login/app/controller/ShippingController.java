package login.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ShippingController {
    @GetMapping("shipping")
    public String getMethodName() {
        return "shipping";
    }
    
}
