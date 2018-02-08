package cn.doing;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan
@EnableAutoConfiguration
//与@SpringBootApplication等价
public class Application{

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}