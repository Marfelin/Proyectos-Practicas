package com.tuempresa.web.microservicesintegration.Controlador;

import com.tuempresa.web.microservicesintegration.DatabaseConnection;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
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
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

@RestController
public class ReportGeneratorCcostosv {

    @GetMapping("/GenerarReporteCcostosv")
    public void generarReporteCcostosv(HttpServletResponse response) throws Exception {
        Connection conn = DatabaseConnection.getConnection();

        InputStream reportStream = getClass().getResourceAsStream("/CentrodecostosVisita.jasper");
        if (reportStream == null) {
            throw new ServletException("El archivo de reporte no se encontró.");
        }

        JasperReport report = (JasperReport) JRLoader.loadObject(reportStream);

        Map<String, Object> parameters = new HashMap<>();

        JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);

        // Mostrar y descargar el reporte en PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=CentrodecostosVisita.pdf");
        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());

        // Guardar el reporte en Excel automáticamente
        guardarReporteEnExcel(print, "CentrodecostosVisita");
    }

    private void guardarReporteEnExcel(JasperPrint print, String nombreArchivo) throws Exception {
        // Configuración para exportar a Excel
        JRXlsxExporter exporter = new JRXlsxExporter();
        exporter.setExporterInput(new SimpleExporterInput(print));

        // Guardar el archivo Excel en la misma ubicación que el archivo PDF
        File archivoExcel = new File(nombreArchivo + ".xlsx");
        FileOutputStream fos = new FileOutputStream(archivoExcel);
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(fos));

        SimpleXlsxReportConfiguration configuration = new SimpleXlsxReportConfiguration();
        configuration.setOnePagePerSheet(true);
        exporter.setConfiguration(configuration);

        exporter.exportReport();
        fos.close();
    }
}

