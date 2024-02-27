package br.com.nadd.api.controller;

import org.springframework.web.bind.annotation.*;
@CrossOrigin
@RestController
public class LoginController {

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        return "logout";
    }
}
