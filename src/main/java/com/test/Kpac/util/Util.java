
package com.test.Kpac.util;

import com.google.gson.Gson;
import com.test.Kpac.model.Kpac;
import com.test.Kpac.model.KpacSet;
import com.test.Kpac.service.KpacService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

public class Util {
    
       
    public static KpacSet parseKpacSet (String s, KpacService kpacServ) {
        KpacSet newkpacSet = new KpacSet();
        List<Kpac> kpacSetList = new ArrayList<>();
        Gson gson = new Gson();
        String body = s.replace("true", "select").replace("false", "none");
        Map<String, String> bodyMap = gson.fromJson(body, Map.class);
        newkpacSet.setTitle(bodyMap.get("title"));
        bodyMap.remove("title");
        bodyMap.remove("id");
        Iterator<String> iterator = bodyMap.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();
            String get = bodyMap.get(key);
            if (bodyMap.get(key).equals("select")) {
                //Long id = Long.valueOf(key);
                //kpacServ.getOne(id);
                kpacSetList.add(kpacServ.getOne(Long.valueOf(key)));
            }
        }
        newkpacSet.setKpaks(kpacSetList);
        return newkpacSet;
    }
    
}
