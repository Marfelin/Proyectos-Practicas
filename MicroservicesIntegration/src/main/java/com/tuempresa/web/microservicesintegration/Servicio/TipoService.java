/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Servicio;
import com.tuempresa.web.microservicesintegration.Modelo.Tipo;
import com.tuempresa.web.microservicesintegration.Repositorio.TipoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoService {

    @Autowired
    private TipoRepository tipoRepository;

    public List<Tipo> findAll() {
        return tipoRepository.findAll();
    }

    public Tipo findById(Integer id) {
        return tipoRepository.findById(id).orElse(null);
    }

    public Tipo save(Tipo tipo) {
        return tipoRepository.save(tipo);
    }

    public void deleteById(Integer id) {
        tipoRepository.deleteById(id);
    }
}

