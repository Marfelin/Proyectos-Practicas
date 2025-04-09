/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Modelo;

import javax.persistence.*;

@Entity
@Table(name = "permisos")
public class Permisos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "usuarioid", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "fin_areasid_area")
    private FinAreas finAreas;

    @ManyToOne
    @JoinColumn(name = "assns_almacenid_almacen")
    private AssnsAlmacen assnsAlmacen;

    // Getters y Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public FinAreas getFinAreas() {
        return finAreas;
    }

    public void setFinAreas(FinAreas finAreas) {
        this.finAreas = finAreas;
    }

    public AssnsAlmacen getAssnsAlmacen() {
        return assnsAlmacen;
    }

    public void setAssnsAlmacen(AssnsAlmacen assnsAlmacen) {
        this.assnsAlmacen = assnsAlmacen;
    }
    
}

