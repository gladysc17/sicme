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
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import util.ConexionPostgres;
import net.sf.jasperreports.engine.JasperExportManager;

/**
 *
 * @author Gladys M
 */
@WebServlet(name = "usuarios", urlPatterns = {"/usuarios"})
public class usuarios extends HttpServlet {

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
        
        String tipou = request.getParameter("tipous");
        String fechaI = request.getParameter("fechaIC");
        String fechaF = request.getParameter("fechaIC2");                   
                
        System.out.println(" tipou " + tipou + " fechaI " + fechaI + " fechaF " + fechaF);        
        
        Date fec = Date.valueOf(fechaI);
        Date fec2 = Date.valueOf(fechaF);
        System.out.println(" fec " + fec + " fec2 " + fec2 );
        try {             
            System.out.println("Iniciando");
            if(tipou.equals("todos")){
                System.out.println("entra if");
            Map m = new HashMap();
            System.out.println("Crea map");
            
            m.put("fechaI", fec);
            m.put("fechaF", fec2);
            System.out.println("Agrega variables");
                    
                    JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("usuarioTodos.jasper"));
                    JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                    //JasperViewer viewer = new JasperViewer(jasperPrint, false);
                    String str = File.createTempFile("sadq", "as").getParent()+"\\" + System.currentTimeMillis() + ".pdf";
                    File f = new File(str); 
                    JasperExportManager.exportReportToPdfFile(jasperPrint, str);
                    //viewer.setTitle("Mi Reporte");
                    //viewer.setVisible(true);
                    System.out.println("Reporte creado asda " +f.getAbsolutePath());
                    generarDescargaPDF(str, request, response);
            }
            
            else if(tipou.equals("docente") || tipou.equals("administrativo") || tipou.equals("servicios_generales") || tipou.equals("medico")){
            
            Map m = new HashMap();            
                
            m.put("tipou", tipou);
            m.put("fechaI", fec);
            m.put("fechaF", fec2);
            
            System.out.println(" tipou llega a jasper " + tipou + " fechaI " + fechaI + " fechaF " + fechaF);   
                    
                    JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("usuarioTipo.jasper"));
                    JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                    String str = File.createTempFile("sadq", "as").getParent()+"\\" + System.currentTimeMillis() + ".pdf";
                    File f = new File(str); 
                    JasperExportManager.exportReportToPdfFile(jasperPrint, str);
                    //JasperViewer viewer = new JasperViewer(jasperPrint, false);
                    //viewer.setTitle("Mi Reporte");
                    //viewer.setVisible(true);
                                                               
            }
            else if(tipou.equals("estudiante") ){
            
            Map m = new HashMap();            
                
            m.put("tipou", tipou);
            m.put("fechaI", fec);
            m.put("fechaF", fec2);
            
            System.out.println(" tipou llega a jasper " + tipou + " fechaI " + fechaI + " fechaF " + fechaF);   
                    
                    JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResourceAsStream("usuarioEstudiantes.jasper"));
                    JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, m, co);
                    String str = File.createTempFile("sadq", "as").getParent()+"\\" + System.currentTimeMillis() + ".pdf";
                    File f = new File(str); 
                    JasperExportManager.exportReportToPdfFile(jasperPrint, str);
                    //JasperViewer viewer = new JasperViewer(jasperPrint, false);
                    //viewer.setTitle("Mi Reporte");
                    //viewer.setVisible(true);
                                                               
            }

        } catch (Exception ex) {
            System.out.println("error " + ex);
            ex.printStackTrace();
            Logger.getLogger(usuarios.class.getName()).log(Level.SEVERE, null, ex);
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

    
       
    protected void generarDescargaPDF(String ruta, HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        try {
            String originalFileName = "descarga.pdf";
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
