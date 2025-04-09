/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Modelos;


import javax.persistence.*;

@Entity
@Table(name = "assns_centros_costo")
public class AssnsCentrosCosto {

    @Id
    @Column(name = "id_ccosto", nullable = false, length = 10)
    private String idCcosto;

    @Column(name = "desc_ccosto", nullable = false, length = 50)
    private String descCcosto;

    // Getters y Setters

    public String getIdCcosto() {
        return idCcosto;
    }

    public void setIdCcosto(String idCcosto) {
        this.idCcosto = idCcosto;
    }

    public String getDescCcosto() {
        return descCcosto;
    }

    public void setDescCcosto(String descCcosto) {
        this.descCcosto = descCcosto;
    }
    
}

