/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Controlador;




import com.tuempresa.web.microservicesintegration.Modelo.Tipo;
import com.tuempresa.web.microservicesintegration.Servicio.TipoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tipos")
public class TipoController {

    @Autowired
    private TipoService tipoService;

    @GetMapping
    public List<Tipo> getAllTipos() {
        return tipoService.findAll();
    }

    @GetMapping("/{id}")
    public Tipo getTipoById(@PathVariable Integer id) {
        return tipoService.findById(id);
    }

    @PostMapping
    public Tipo createTipo(@RequestBody Tipo tipo) {
        return tipoService.save(tipo);
    }

    @PutMapping("/{id}")
    public Tipo updateTipo(@PathVariable Integer id, @RequestBody Tipo tipo) {
        tipo.setId(id);
        return tipoService.save(tipo);
    }

    @DeleteMapping("/{id}")
    public void deleteTipo(@PathVariable Integer id) {
        tipoService.deleteById(id);
    }
}

