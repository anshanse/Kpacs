package com.test.Kpac.model;

import java.io.Serializable;

public interface BaseEntity<ID> extends Serializable{
    
    ID getId();
    
}
