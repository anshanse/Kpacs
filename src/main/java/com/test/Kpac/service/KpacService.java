package com.test.Kpac.service;

import com.test.Kpac.model.Kpac;
import com.test.Kpac.repository.KpacRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KpacService {

    @Autowired
    private KpacRepository repo;

    public Kpac add (Kpac kpac){
        return repo.save(kpac);
    }
    
    public void delete (Long id){
        repo.deleteById(id);
    }
    
    public List<Kpac> getAll(){
        return repo.findAll();
    }
    
    public Kpac getOne(Long id){
        return repo.getById(id);
    }
    
}
