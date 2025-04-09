/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tuempresa.web.microservicesintegration.Controlador;

import com.tuempresa.web.microservicesintegration.DatabaseConnection;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@RestController
public class ReportGeneratorUyHsf {

    @GetMapping("/GenerarReporteUyHsf")
    public void generarReporteUyHsf(@RequestParam String usuarioid, HttpServletResponse response) throws Exception {
        Connection conn = DatabaseConnection.getConnection();

        InputStream reportStream = getClass().getResourceAsStream("/ReporteUyHSinFiltro.jasper");
        if (reportStream == null) {
            throw new ServletException("El archivo de reporte no se encontró.");
        }

        JasperReport report = (JasperReport) JRLoader.loadObject(reportStream);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("usuarioid", usuarioid);

        JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=ReporteUyHSinFiltro.pdf");

        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
    }
}

 
