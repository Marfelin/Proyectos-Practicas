/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.Modelos;


import javax.persistence.*;

@Entity
@Table(name = "assns_activos_fijos")
public class AssnsActivosFijos {

    @Id
    @Column(name = "id", nullable = false, length = 255)
    private String id;

    @Column(name = "codigo", nullable = false, length = 15)
    private String codigo;

    @Column(name = "descripcion", nullable = false, length = 200)
    private String descripcion;

    @Column(name = "Valor Inicial", nullable = false, length = 12)
    private String valorInicial;

    @Column(name = "Valor InicialMC", nullable = false, length = 12)
    private String valorInicialMC;

    @Column(name = "Tasa de preciacion", nullable = false, length = 12)
    private String tasaDePreciacion;

    @Column(name = "Depreciacion acumulada", nullable = false, length = 12)
    private String depreciacionAcumulada;

    @Column(name = "Depreciacion acumuladaMC", nullable = false, length = 12)
    private String depreciacionAcumuladaMC;

    @Column(name = "Nombre empleado", nullable = false, length = 62)
    private String nombreEmpleado;

    @Column(name = "Estado Actual", nullable = false, length = 50)
    private String estadoActual;

    @Column(name = "fecha_alta", length = 50)
    private String fechaAlta;

    @Column(name = "numero_serie", nullable = false, length = 30)
    private String numeroSerie;

    @ManyToOne
    @JoinColumn(name = "fin_areasid_area", nullable = false)
    private FinAreas finAreas;

    @ManyToOne
    @JoinColumn(name = "assns_clasificacion_activofijoid_clasificacion", nullable = false)
    private AssnsClasificacionActivofijo assnsClasificacionActivofijo;

    @ManyToOne
    @JoinColumn(name = "assns_subclasificacion_activofijoid_subclasificacion", nullable = false)
    private AssnsSubclasificacionActivofijo assnsSubclasificacionActivofijo;

    // Getters y Setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getValorInicial() {
        return valorInicial;
    }

    public void setValorInicial(String valorInicial) {
        this.valorInicial = valorInicial;
    }

    public String getValorInicialMC() {
        return valorInicialMC;
    }

    public void setValorInicialMC(String valorInicialMC) {
        this.valorInicialMC = valorInicialMC;
    }

    public String getTasaDePreciacion() {
        return tasaDePreciacion;
    }

    public void setTasaDePreciacion(String tasaDePreciacion) {
        this.tasaDePreciacion = tasaDePreciacion;
    }

    public String getDepreciacionAcumulada() {
        return depreciacionAcumulada;
    }

    public void setDepreciacionAcumulada(String depreciacionAcumulada) {
        this.depreciacionAcumulada = depreciacionAcumulada;
    }

    public String getDepreciacionAcumuladaMC() {
        return depreciacionAcumuladaMC;
    }

    public void setDepreciacionAcumuladaMC(String depreciacionAcumuladaMC) {
        this.depreciacionAcumuladaMC = depreciacionAcumuladaMC;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getEstadoActual() {
        return estadoActual;
    }

    public void setEstadoActual(String estadoActual) {
        this.estadoActual = estadoActual;
    }

    public String getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(String fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public FinAreas getFinAreas() {
        return finAreas;
    }

    public void setFinAreas(FinAreas finAreas) {
        this.finAreas = finAreas;
    }

    public AssnsClasificacionActivofijo getAssnsClasificacionActivofijo() {
        return assnsClasificacionActivofijo;
    }

    public void setAssnsClasificacionActivofijo(AssnsClasificacionActivofijo assnsClasificacionActivofijo) {
        this.assnsClasificacionActivofijo = assnsClasificacionActivofijo;
    }

    public AssnsSubclasificacionActivofijo getAssnsSubclasificacionActivofijo() {
        return assnsSubclasificacionActivofijo;
    }

    public void setAssnsSubclasificacionActivofijo(AssnsSubclasificacionActivofijo assnsSubclasificacionActivofijo) {
        this.assnsSubclasificacionActivofijo = assnsSubclasificacionActivofijo;
    }
    
}
