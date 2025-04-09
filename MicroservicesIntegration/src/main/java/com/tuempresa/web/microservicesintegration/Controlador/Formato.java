package com.tuempresa.web.microservicesintegration.Controlador;

public class Formato {
    private String tipo;

    public Formato() {
    }

    public Formato(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean esPdf() {
        return "pdf".equalsIgnoreCase(tipo);
    }

    public boolean esExcel() {
        return "excel".equalsIgnoreCase(tipo);
    }
}



