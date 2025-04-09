/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Modelo;


import javax.persistence.*;

@Entity
@Table(name = "fin_areas")
public class FinAreas {

    @Id
    @Column(name = "id_area", nullable = false, length = 10)
    private String idArea;

    @Column(name = "codigo", nullable = false, length = 10)
    private String codigo;

    @Column(name = "descripcion", nullable = false, length = 50)
    private String descripcion;

    @Column(name = "siglas", length = 50)
    private String siglas;

    @Column(name = "id_empleado_responsable")
    private Integer idEmpleadoResponsable;

    @Column(name = "id_tipo", nullable = false)
    private Integer idTipo;

    @ManyToOne
    @JoinColumn(name = "assns_centros_costoid_ccosto", nullable = false)
    private AssnsCentrosCosto assnsCentrosCosto;

    // Getters y Setters

    public String getIdArea() {
        return idArea;
    }

    public void setIdArea(String idArea) {
        this.idArea = idArea;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public Integer getIdEmpleadoResponsable() {
        return idEmpleadoResponsable;
    }

    public void setIdEmpleadoResponsable(Integer idEmpleadoResponsable) {
        this.idEmpleadoResponsable = idEmpleadoResponsable;
    }

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public AssnsCentrosCosto getAssnsCentrosCosto() {
        return assnsCentrosCosto;
    }

    public void setAssnsCentrosCosto(AssnsCentrosCosto assnsCentrosCosto) {
        this.assnsCentrosCosto = assnsCentrosCosto;
    }
    
}
