package dev.be.github_action_variable_substitution.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @Value("${application.value}")
    private String value;

    @GetMapping("/demo")
    public String demo() {
        return value;
    }
}
