package com.test.Kpac.model;

import java.io.Serial;
import java.sql.Date;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="kpac")
public class Kpac implements BaseEntity<Long>{

    @Serial
    private static final long serialVersionUID = 1L;
          
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    
    @Column(name = "title", length = 250)
    private String title;
    
    @Column(name = "description", length = 2000)
    private String description;
    
    @Column(name = "create_date")
    @DateTimeFormat(pattern = "DD-MM-YYYY")
    private String creationDate;
    
}
