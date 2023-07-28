package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "konsumen")
@Data
public class Konsumen {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nama;

    private String alamat;

    private String kota;

    private String provinsi;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "tgl_registrasi")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date tglRegistrasi;

    private String status;


}
