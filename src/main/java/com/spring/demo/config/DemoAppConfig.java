package com.spring.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@ComponentScan(basePackages = "com.spring.demo")
@EnableWebMvc // <mvc:annotation-driven/>
@Configuration
public class DemoAppConfig {

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

}
