/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Repositorio;


import com.tuempresa.web.microservicesintegration.Modelo.AssnsActivosFijos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssnsActivosFijosRepository extends JpaRepository<AssnsActivosFijos, String> {

}

