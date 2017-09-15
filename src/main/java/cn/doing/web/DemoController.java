package cn.doing.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class DemoController {


    @RequestMapping(value = "test", method = RequestMethod.GET)
    public String home() {
        System.out.println("hello world !! this is my log  ");
        return "hello world !! ";
    }

}
