package dev.be.github_action_variable_substitution.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    /*
    Github Action에서 주입받은 값으로 변경됨을 확인하기 위한 변수
     */
    @Value("${override.value}")
    private String overrideValue;

    @GetMapping("/demo")
    public String demo() {
        return overrideValue;
    }
}
