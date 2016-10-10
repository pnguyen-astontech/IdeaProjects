package com.astontech.fap.repositories;

import com.astontech.fap.domain.User;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Created by petenguy1 on 10/3/2016.
 */
public interface UserRepository extends CrudRepository<User, Integer> {

    @Query(value = "SELECT person_id FROM users WHERE username = :username", nativeQuery = true)
    Integer findIdByUsername(@Param("username") String username);

}
