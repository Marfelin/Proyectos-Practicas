/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Repositorios;


import com.tuempresa.web.Modelos.AssnsActivosFijos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssnsActivosFijosRepository extends JpaRepository<AssnsActivosFijos, String> {
}

