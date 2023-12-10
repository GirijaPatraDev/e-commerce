package login.app.pojo;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class User {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Integer userId;
    private String name;
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Address address;
    private String username;
    private String password;
    private String email;
}
