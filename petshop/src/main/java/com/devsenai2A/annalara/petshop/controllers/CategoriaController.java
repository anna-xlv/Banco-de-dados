package com.devsenai2A.annalara.petshop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devsenai2A.annalara.petshop.entities.Categoria;
import com.devsenai2A.annalara.petshop.service.CategoriaService;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {
	
	@Autowired
	private CategoriaService service;

	@PostMapping
	public ResponseEntity<Categoria> cadastrarCategoria(@RequestBody Categoria categoria) {
	    Categoria novoCategoria = service.cadastrar(categoria);
	    return ResponseEntity.status(HttpStatus.CREATED).body(novoCategoria);
	}


	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deletarCategoria(@PathVariable Long id) {

	boolean removido = service.deletar(id);

	if (!removido) {
	return ResponseEntity.notFound().build();
	}

	return ResponseEntity.noContent().build();
	}

	@PutMapping("/{id}")
	public ResponseEntity<Categoria> atualizarUsuario(
	@PathVariable Long id,
	@RequestBody Categoria categoria) {

	Categoria usuarioAtualizado = service.atualizar(id, categoria);

	if (categoriaAtualizado == null) {
	return ResponseEntity.notFound().build();
	}

	return ResponseEntity.ok(categoriaAtualizado);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Categoria> buscarPorId(@PathVariable Long id) {
	    Categoria categoria = service.buscarPorId(id);
	    if (categoria == null) return ResponseEntity.notFound().build();
	    return ResponseEntity.ok(categoria);
	}

	@GetMapping
	public List<Categoria> listarCategoria() {
	return service.listarTodos();
	}

}
