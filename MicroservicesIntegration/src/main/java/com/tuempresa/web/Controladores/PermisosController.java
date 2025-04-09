/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Controladores;

import com.tuempresa.web.Modelos.Permisos;
import com.tuempresa.web.Servicios.PermisosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/permisos")
public class PermisosController {

    @Autowired
    private PermisosService permisosService;

    @GetMapping
    public List<Permisos> getAllPermisos() {
        return permisosService.findAll();
    }

    @GetMapping("/{id}")
    public Permisos getPermisosById(@PathVariable Long id) {
        return permisosService.findById(id);
    }

    @PostMapping
    public Permisos createPermisos(@RequestBody Permisos permisos) {
        return permisosService.save(permisos);
    }

    @PutMapping("/{id}")
    public Permisos updatePermisos(@PathVariable Long id, @RequestBody Permisos permisos) {
        permisos.setId(id);
        return permisosService.save(permisos);
    }

    @DeleteMapping("/{id}")
    public void deletePermisos(@PathVariable Long id) {
        permisosService.deleteById(id);
    }
}

