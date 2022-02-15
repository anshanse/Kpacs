package com.test.Kpac.model;

import java.io.Serial;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "kpacset")
public class KpacSet implements BaseEntity<Long>{

    @Serial
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    
    @Column(name = "title", length = 250)
    private String title;
    
    @ManyToMany(cascade = CascadeType.PERSIST)
    @JoinTable(
            name = "kpac_kpacset",
            joinColumns = {@JoinColumn(name = "kpacset_id")},
            inverseJoinColumns = {@JoinColumn(name = "kpac_id")}
    )
    private List<Kpac> kpaks;
}
