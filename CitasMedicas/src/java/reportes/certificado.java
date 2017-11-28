/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import util.ConexionPostgres;

/**
 *
 * @author usuario
 */
@WebServlet(name = "certificado", urlPatterns = {"/certificado"})
public class certificado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        int idcita = Integer.parseInt(request.getParameter("idcita"));

        try {

            Map m = new HashMap();

            m.put("idcita", idcita);
            System.out.println("idcita" + idcita);

            JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("certificado.jasper"));
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
            String str = File.createTempFile("sadq", "as").getParent()+"\\" + System.currentTimeMillis() + ".pdf";
            File f = new File(str); 
            JasperExportManager.exportReportToPdfFile(jasperPrint, str);
            //JasperViewer viewer = new JasperViewer(jasperPrint, false);
            //viewer.setTitle("Mi Reporte");
            //viewer.setVisible(true);
            generarDescargaPDF(str, request, response);

        } catch (JRException ex) {
            Logger.getLogger(historia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void generarDescargaPDF(String ruta, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String originalFileName = "certificado.pdf";
            java.io.File f = new java.io.File(ruta);
            int length = 0;
            String mimetype = getServletConfig().getServletContext().getMimeType(f.getAbsolutePath());
            ServletOutputStream myOut = response.getOutputStream();

            response.setContentType((mimetype != null) ? mimetype : "application/octet-stream");
            response.setContentLength((int) f.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");

            byte[] bbuf = new byte[1024];
            java.io.DataInputStream in = new java.io.DataInputStream(new java.io.FileInputStream(f));

            while ((in != null) && ((length = in.read(bbuf)) != -1)) {
                myOut.write(bbuf, 0, length);
            }

            in.close();
            myOut.flush();
            myOut.close();
        } catch (Exception e) {
            System.err.println("Error");
        }
    }
}
