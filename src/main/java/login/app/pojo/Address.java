package login.app.pojo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Entity
@Data
public class Address {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    @NotBlank(message = "pincode may not be empty")
    @Pattern(regexp = "^[0-9]+$", message = "pincode should contain only numbers")
    private String postalcode;
    @NotBlank(message = "city may not be empty")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "city should contain only letters")
    private String city;
    @NotBlank(message = "city may not be empty")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "city should contain only letters")
    private String state;
    @OneToOne @JoinColumn(name = "user_id")
    private User user;
}
