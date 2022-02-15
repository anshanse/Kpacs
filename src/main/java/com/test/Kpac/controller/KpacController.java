package com.test.Kpac.controller;

import com.google.gson.Gson;
import com.test.Kpac.model.Kpac;
import com.test.Kpac.service.KpacService;
import java.io.Serial;
import javax.servlet.http.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/kpacs")
public class KpacController extends HttpServlet{
    
    @Serial
    private static final long serialVersionUID = 1L;
    
    @Autowired
    private KpacService serv;
    
    @GetMapping
    public  String getKpacs (Model model){
        Gson gson = new Gson();
        model.addAttribute("datakpacs", gson.toJson(serv.getAll()));
        return "kpacs";
    }
    
    @GetMapping("delete/{id}")
    public String delKpac (@PathVariable String id){
        serv.delete(Long.valueOf(id));
        return "redirect:/kpacs";
    }
    
    @PostMapping("/add")
    public String addKpac(@RequestBody Kpac newkpac){
        serv.add(newkpac);
        return"kpacs";
    }
    
}
