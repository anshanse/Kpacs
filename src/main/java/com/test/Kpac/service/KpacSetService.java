package com.test.Kpac.service;

import com.test.Kpac.model.Kpac;
import com.test.Kpac.model.KpacSet;
import com.test.Kpac.repository.KpacSetRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class KpacSetService {
    
    @Autowired
    private KpacSetRepository repo;
    
    public KpacSet add (KpacSet kpacSet){
        return repo.save(kpacSet);
    }
    
    public void delete (Long id){
        repo.deleteById(id);
    }
    
    public List<KpacSet> getAll (){
        return repo.findAll();
    }
    
    public KpacSet getOne (Long id){
        return repo.getById(id);
    }
    
    public List<Kpac> getOneSet (Long id){
        return getOne(id).getKpaks();
    }
}
