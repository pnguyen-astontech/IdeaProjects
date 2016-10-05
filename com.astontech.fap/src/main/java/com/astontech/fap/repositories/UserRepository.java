package com.astontech.fap.repositories;

import com.astontech.fap.domain.User;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by petenguy1 on 10/3/2016.
 */
public interface UserRepository extends CrudRepository<User, Integer> {
}
