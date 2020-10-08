package com.spring.demo.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Objects;
import java.util.logging.Logger;

@PropertySource("classpath:properties/persistence-mysql.properties")
@ComponentScan(basePackages = "com.spring.demo")
@EnableWebMvc // <mvc:annotation-driven/>
@Configuration
public class DemoAppConfig {

    // set up variable to hold the properties
    private final Environment environment;
    private final Logger logger = Logger.getLogger(getClass().getName());

    public DemoAppConfig(Environment environment) {
        this.environment = environment;
    }

/*
    <!--Define Spring MVC view resolver -- >
    <bean
        class="org.springframework.web.servlet.view.InternalResourceViewResolver" >
        <property name = "prefix" value = "/WEB-INF/view/" / >
        <property name = "suffix" value = ".jsp" / >
    </bean>
*/

    // define a bean for ViewResolver
    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }

    // define a bean for our security datasource
    @Bean
    public DataSource dataSource() {

        // create connection pool
        ComboPooledDataSource dataSource = new ComboPooledDataSource();

        // set the jdbc driver class
        try {
            dataSource.setDriverClass(environment.getProperty("jdbc.driver"));
        } catch (PropertyVetoException e) {
            throw new RuntimeException(e);
        }

        // set database connection props
        dataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
        dataSource.setUser(environment.getProperty("jdbc.user"));
        dataSource.setPassword(environment.getProperty("jdbc.password"));

        // log the connection props
        logger.info(">>> jdbc.url=" + dataSource.getJdbcUrl());
        logger.info(">>> jdbc.user=" + dataSource.getUser());

        // set connection pool props
        dataSource.setInitialPoolSize(getValue("connection.pool.initialPoolSize"));
        dataSource.setMinPoolSize(getValue("connection.pool.minPoolSize"));
        dataSource.setMaxPoolSize(getValue("connection.pool.maxPoolSize"));
        dataSource.setMaxIdleTime(getValue("connection.pool.maxIdleTime"));

        return dataSource;
    }

    private int getValue(String key) {
        return Integer.parseInt(Objects.requireNonNull(environment.getProperty(key), key + " null"));
    }

}
