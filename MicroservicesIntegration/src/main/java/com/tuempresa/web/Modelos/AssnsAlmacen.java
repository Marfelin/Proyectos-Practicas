/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Modelos;


import javax.persistence.*;

@Entity
@Table(name = "assns_almacen")
public class AssnsAlmacen {

    @Id
    @Column(name = "id_almacen", nullable = false, length = 5)
    private String idAlmacen;

    @Column(name = "desc_almacen", nullable = false, length = 50)
    private String descAlmacen;

    @Column(name = "direccion", nullable = false, length = 255)
    private String direccion;

    @ManyToOne
    @JoinColumn(name = "assns_centros_costoid_ccosto", nullable = false)
    private AssnsCentrosCosto assnsCentrosCosto;

    // Getters y Setters

    public String getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(String idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public String getDescAlmacen() {
        return descAlmacen;
    }

    public void setDescAlmacen(String descAlmacen) {
        this.descAlmacen = descAlmacen;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public AssnsCentrosCosto getAssnsCentrosCosto() {
        return assnsCentrosCosto;
    }

    public void setAssnsCentrosCosto(AssnsCentrosCosto assnsCentrosCosto) {
        this.assnsCentrosCosto = assnsCentrosCosto;
    }
    
}

