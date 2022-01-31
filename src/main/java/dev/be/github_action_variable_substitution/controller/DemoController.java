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

    /*f
    프로젝트 application.yaml에 정의되어 있지 않지만
    Github Action에서 주입 받아 사용이 가능함을 확인하기 위한 변수
     */
    @Value("${from.github.secret:null}")
    private String fromGithubSecret;

    @GetMapping("/demo")
    public String demo() {
        return overrideValue + " / " + fromGithubSecret;
    }
}
