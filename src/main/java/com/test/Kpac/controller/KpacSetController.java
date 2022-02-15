package com.test.Kpac.controller;

import com.google.gson.Gson;
import com.test.Kpac.model.Kpac;
import com.test.Kpac.model.KpacSet;
import com.test.Kpac.service.KpacService;
import com.test.Kpac.service.KpacSetService;
import com.test.Kpac.util.Util;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sets")
public class KpacSetController extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    @Autowired
    private KpacSetService kpacSetServ; 
    
    @Autowired
    private KpacService kpacServ;
    
    @GetMapping
     public String getKpacSets (Model model){
        Gson gson = new Gson();
        model.addAttribute("datakpacset", gson.toJson(kpacSetServ.getAll()));
        model.addAttribute("datakpacs",gson.toJson(kpacServ.getAll()));
        return "sets";
    }
     
     @GetMapping("delete/{id}")
    public String delKpac (@PathVariable String id){
        kpacSetServ.delete(Long.valueOf(id));
        return "redirect:/sets";
    }
    
    @GetMapping("/{id}")
    public String getDetailSet(@PathVariable String id, Model model){
        Gson gson = new Gson();
        List<Kpac> oneSet = kpacSetServ.getOneSet(Long.valueOf(id));
        model.addAttribute("datakpacs", gson.toJson(oneSet));
        return "detail";
    }
    
    @PostMapping("add")
    public String addKpacSet(@RequestBody String body){
        kpacSetServ.add(Util.parseKpacSet(body, kpacServ));
        return "sets";
    }
}
