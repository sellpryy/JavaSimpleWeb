package com.example.demo.controller;

import com.example.demo.model.Konsumen;
import com.example.demo.repository.KonsumenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WelcomeController {
    @Autowired
    private KonsumenRepository konsumenRepository;

    @GetMapping("/")
    public String listKonsumen() {
        return "list";
    }

    @GetMapping("/form")
    public String index(ModelMap model){
        model.addAttribute("konsumen", new Konsumen());
        return "form";
    }

    @PostMapping("/save")
    public String saveKonsumen(@ModelAttribute Konsumen konsumen) {
        konsumenRepository.save(konsumen);
        return "redirect:/";
    }



    @GetMapping("/api/konsumen")
    @ResponseBody
    public List<Konsumen> getKonsumen() {
            return konsumenRepository.findAll();

    }

}
