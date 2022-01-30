package dev.be.github_action_variable_substitution.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @Value("${developer.name}")
    private String name;

    @GetMapping("/demo")
    public String demo() {
        return "My Name is " + name;
    }
}
