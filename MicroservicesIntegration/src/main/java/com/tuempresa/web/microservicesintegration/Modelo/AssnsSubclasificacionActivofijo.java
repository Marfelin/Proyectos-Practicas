/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Modelo;


import javax.persistence.*;

@Entity
@Table(name = "assns_subclasificacion_activofijo")
public class AssnsSubclasificacionActivofijo {

    @Id
    @Column(name = "id_subclasificacion", nullable = false, length = 5)
    private String idSubclasificacion;

    @Column(name = "desc_subclasificacion", nullable = false, length = 50)
    private String descSubclasificacion;

    // Getters y Setters

    public String getIdSubclasificacion() {
        return idSubclasificacion;
    }

    public void setIdSubclasificacion(String idSubclasificacion) {
        this.idSubclasificacion = idSubclasificacion;
    }

    public String getDescSubclasificacion() {
        return descSubclasificacion;
    }

    public void setDescSubclasificacion(String descSubclasificacion) {
        this.descSubclasificacion = descSubclasificacion;
    }
    
}

