/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Servicios;

import com.tuempresa.web.Modelos.AssnsActivosFijos;
import com.tuempresa.web.Repositorios.AssnsActivosFijosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssnsActivosFijosService {

    @Autowired
    private AssnsActivosFijosRepository assnsActivosFijosRepository;

    public List<AssnsActivosFijos> findAll() {
        return assnsActivosFijosRepository.findAll();
    }

    public AssnsActivosFijos findById(String id) {
        return assnsActivosFijosRepository.findById(id).orElse(null);
    }

    public AssnsActivosFijos save(AssnsActivosFijos assnsActivosFijos) {
        return assnsActivosFijosRepository.save(assnsActivosFijos);
    }

    public void deleteById(String id) {
        assnsActivosFijosRepository.deleteById(id);
    }
}
