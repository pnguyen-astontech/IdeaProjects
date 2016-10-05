package com.astontech.fap.configuration;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by petenguy1 on 9/28/2016.
 */
@Configuration
@EnableAutoConfiguration
@EntityScan(basePackages = {"com.astontech.fap.domain"})
@EnableJpaRepositories(basePackages = {"com.astontech.fap.repositories"})
@EnableTransactionManagement
public class RepositoryConfiguration {
}
