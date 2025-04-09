/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Servicio;

import com.tuempresa.web.microservicesintegration.Repositorio.PermisosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermisosService {

    @Autowired
    private PermisosRepository permisosRepository;

//    public List<Permisos> findAll() {
//        return permisosRepository.findAll();
//    }
//
//    public Permisos findById(Long id) {
//        return permisosRepository.findById(id).orElse(null);
//    }
//
//    public Permisos save(Permisos permisos) {
//        return permisosRepository.save(permisos);
//    }
//
//    public void deleteById(Long id) {
//        permisosRepository.deleteById(id);
//    }
}
