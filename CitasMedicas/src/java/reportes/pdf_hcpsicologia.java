/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "pdf_hcpsicologia", urlPatterns = {"/pdf_hcpsicologia"})
public class pdf_hcpsicologia extends HttpServlet {

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

        String id = request.getParameter("identf");
        String usuario = request.getParameter("usuario");
        String idecita = request.getParameter("idcita");

        System.out.println(" id " + id + " tipo " + usuario + " idcita " + idecita);

        try {
            Map m = new HashMap();
                    int idcita = Integer.parseInt(idecita);
                    System.out.println(" idcita " + idcita);
                    m.put("idcita", idcita);
            
            switch (usuario) {
                case "estudiante":
                    
                    JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_est.jasper"));
                    JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                    JasperViewer viewer = new JasperViewer(jasperPrint);
                    viewer.setTitle("Mi Reporte");
                    viewer.setVisible(true);
                    break;
                case "docente":
                    JasperReport reporte2 = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_doc.jasper"));
                    JasperPrint jasperPrint2 = JasperFillManager.fillReport(reporte2, m, co);
                    JasperViewer viewer2 = new JasperViewer(jasperPrint2);
                    viewer2.setTitle("Mi Reporte");
                    viewer2.setVisible(true);
                    break;
                case "profesional":
                    JasperReport reporte3 = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_prof.jasper"));
                    JasperPrint jasperPrint3 = JasperFillManager.fillReport(reporte3, m, co);
                    JasperViewer viewer3 = new JasperViewer(jasperPrint3);
                    viewer3.setTitle("Mi Reporte");
                    viewer3.setVisible(true);
                    break;
                case "otrousuario":
                    JasperReport reporte4 = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_otro.jasper"));
                    JasperPrint jasperPrint4 = JasperFillManager.fillReport(reporte4, m, co);
                    JasperViewer viewer4 = new JasperViewer(jasperPrint4);
                    viewer4.setTitle("Mi Reporte");
                    viewer4.setVisible(true);
                    break;
                case "medico":
                    JasperReport reporte5 = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_med.jasper"));
                    JasperPrint jasperPrint5 = JasperFillManager.fillReport(reporte5, m, co);
                    JasperViewer viewer5 = new JasperViewer(jasperPrint5);
                    viewer5.setTitle("Mi Reporte");
                    viewer5.setVisible(true);
                    break;
                case "serviciogeneral":
                    JasperReport reporte6 = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("hcpsicologia_sg.jasper"));
                    JasperPrint jasperPrint6 = JasperFillManager.fillReport(reporte6, m, co);
                    JasperViewer viewer6 = new JasperViewer(jasperPrint6);
                    viewer6.setTitle("Mi Reporte");
                    viewer6.setVisible(true);
                    break;                                                      
            }

        } catch (JRException ex) {
            Logger.getLogger(pdf_hcmedicinageneral.class.getName()).log(Level.SEVERE, null, ex);
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
