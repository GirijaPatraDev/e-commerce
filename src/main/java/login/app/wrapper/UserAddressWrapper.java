package login.app.wrapper;

import login.app.pojo.Address;
import login.app.pojo.User;
import lombok.Data;
@Data
public class UserAddressWrapper {
    private User user;
    private Address address;
}
