/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Modelos;


import javax.persistence.*;

@Entity
@Table(name = "assns_clasificacion_activofijo")
public class AssnsClasificacionActivofijo {

    @Id
    @Column(name = "id_clasificacion", nullable = false, length = 5)
    private String idClasificacion;

    @Column(name = "desc_clasificacion", nullable = false, length = 50)
    private String descClasificacion;

    // Getters y Setters

    public String getIdClasificacion() {
        return idClasificacion;
    }

    public void setIdClasificacion(String idClasificacion) {
        this.idClasificacion = idClasificacion;
    }

    public String getDescClasificacion() {
        return descClasificacion;
    }

    public void setDescClasificacion(String descClasificacion) {
        this.descClasificacion = descClasificacion;
    }
    
}

