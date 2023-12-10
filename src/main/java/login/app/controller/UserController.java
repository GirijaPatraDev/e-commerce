package login.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import login.app.pojo.User;
import login.app.repo.UserRepo;

@Controller
public class UserController {
    @Autowired private UserRepo userRepo;
    //@Autowired private AddressRepo addressRepo;
    @GetMapping("/signup")
    public String getSignupPage(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "signup";
    }
    @PostMapping("/signup")
    public String handleSignupPage(Model model, User user){
        
        System.out.println(user);
        userRepo.save(user);
        return "signup-success";
    }
    @GetMapping("/login")
    public String getLoginPage(Model model){
        model.addAttribute("user", new User());
        return "login";
    }
    @PostMapping("/login")
    public String handleLoginPage(Model model, @RequestParam String uname, @RequestParam String pwd){
        System.out.println(uname + " " + pwd);
        List<User>  ref = userRepo.findByUsername(uname);
        if (!ref.isEmpty() && ref.get(0).getUsername().equals(uname) && ref.get(0).getPassword().equals(pwd)) {
            // User exists and password is correct
            model.addAttribute("username", uname);
            return "login-success";
        }
        model.addAttribute("errorMsg", "please provide correct credentials");
        return "login";
    }
}
