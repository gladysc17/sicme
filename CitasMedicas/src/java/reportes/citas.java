/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
@WebServlet(name = "citas", urlPatterns = {"/citas"})
public class citas extends HttpServlet {

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

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        System.out.println(" DIA HOY : " + sqlDate);

        String consulta = request.getParameter("consulta");
        String fechaI = request.getParameter("fechaIC");
        String fechaF = request.getParameter("fechaIC2");

        System.out.println(" consulta " + consulta + " fechaI " + fechaI + " fechaF " + fechaF);

        Date fec = Date.valueOf(fechaI);
        Date fec2 = Date.valueOf(fechaF);
        System.out.println(" fec " + fec + " fec2 " + fec2);
        try {

            if (consulta.equals("pro_ser")) {
                Map m = new HashMap();
                
                m.put("fechaI", fec);
                m.put("fechaF", fec2);

                JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("citasProgramaServicio.jasper"));
                JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                JasperViewer viewer = new JasperViewer(jasperPrint, false);
                viewer.setTitle("Mi Reporte");
                viewer.setVisible(true);

            } else if (consulta.equals("programa")) {

                Map m = new HashMap();
                
                m.put("fechaI", fec);
                m.put("fechaF", fec2);

                JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("citasPrograma.jasper"));
                JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                JasperViewer viewer = new JasperViewer(jasperPrint, false);
                viewer.setTitle("Mi Reporte");
                viewer.setVisible(true);

            }
            
            else if (consulta.equals("servicio")) {

                Map m = new HashMap();
                
                m.put("fechaI", fec);
                m.put("fechaF", fec2);

                JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("citasServicio2.jasper"));
                JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                JasperViewer viewer = new JasperViewer(jasperPrint, false);
                viewer.setTitle("Mi Reporte");
                viewer.setVisible(true);

            }

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

}
