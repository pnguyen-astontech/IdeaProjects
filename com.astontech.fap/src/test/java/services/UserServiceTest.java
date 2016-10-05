package services;

import com.astontech.fap.Application;
import com.astontech.fap.domain.User;
import com.astontech.fap.services.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = {Application.class})
@WebAppConfiguration
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void testServiceSave() {
        User user = new User("STEST", "STEST");

        assertNull(user.getId());
        userService.saveUser(user);
        assertNotNull(user.getId());

        User fetchedUser = userService.getUserById(user.getId());
        assertNotNull(fetchedUser);
        assertEquals(user.getId(), fetchedUser.getId());

        fetchedUser.setFirstName("STEST");
        userService.saveUser(fetchedUser);

        User updateUser = userService.getUserById(fetchedUser.getId());
        assertEquals("STEST", updateUser.getFirstName());
    }

    @Test
    public void testServiceDelete() {
        User user = new User("STEST", "STEST");

        assertNull(user.getId());
        userService.saveUser(user);
        assertEquals(1, (int) user.getId());

        userService.deleteUser(1);
        assertNull(userService.getUserById(1));
    }


}
