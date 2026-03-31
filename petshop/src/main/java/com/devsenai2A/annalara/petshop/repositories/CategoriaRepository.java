package com.devsenai2A.annalara.petshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devsenai2A.annalara.petshop.entities.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
	
	Categoria findByNome(String nome);
}
