package login.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import login.app.pojo.User;
import java.util.List;


public interface UserRepo extends JpaRepository<User, Integer> {
    public List<User> findByUsername(String username);
}
