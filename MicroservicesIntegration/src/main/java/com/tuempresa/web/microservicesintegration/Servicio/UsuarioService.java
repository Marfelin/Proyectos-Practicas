/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Servicio;



import com.tuempresa.web.microservicesintegration.Repositorio.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

//    public List<Usuario> findAll() {
//        return usuarioRepository.findAll();
//    }
//
//    public Usuario findById(String id) {
//        return usuarioRepository.findById(id).orElse(null);
//    }
//
//    public Usuario save(Usuario usuario) {
//        return usuarioRepository.save(usuario);
//    }
//
//    public void deleteById(String id) {
//        usuarioRepository.deleteById(id);
//    }
}

