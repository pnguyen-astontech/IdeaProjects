package repositories;

import com.astontech.fap.configuration.RepositoryConfiguration;
import com.astontech.fap.domain.User;
import com.astontech.fap.repositories.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = {RepositoryConfiguration.class})
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void testSaveUser() {
        User user = new User("TEST", "TEST");
        assertNull(user.getId());
        userRepository.save(user);
        assertNotNull(user.getId());

        User fetchedUser = userRepository.findOne(user.getId());
        assertNotNull(fetchedUser);
        assertEquals(user.getId(), fetchedUser.getId());

        fetchedUser.setFirstName("TEST");
        userRepository.save(fetchedUser);

        User updatedUser = userRepository.findOne(fetchedUser.getId());
        assertEquals(updatedUser.getFirstName(), "TEST");
    }

    @Test
    public void testDeleteUser() {
        User user = userRepository.findOne(1);
        assertNotNull(user.getId());
        userRepository.delete(user.getId());
        assertNull(userRepository.findOne(1));
    }

}
