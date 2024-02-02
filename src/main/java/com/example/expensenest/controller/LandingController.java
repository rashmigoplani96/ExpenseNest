package com.example.expensenest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingController {
    @GetMapping("/")
    public String getLandingPage (Model model) {
        model.addAttribute("landing", null);
        return "landing";
    }
}
