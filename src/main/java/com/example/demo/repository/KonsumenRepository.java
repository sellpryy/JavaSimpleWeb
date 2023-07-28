package com.example.demo.repository;

import com.example.demo.model.Konsumen;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KonsumenRepository extends JpaRepository<Konsumen, Long> {
    List<Konsumen> findByNamaContainingIgnoreCase(String keyword);
}
