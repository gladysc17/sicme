<%-- 
    Document   : recargoMedico_ListaAtencionCitasDia
    Created on : 28-mar-2017, 20:03:17
    Author     : Gladys M
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10 col-sm-12">                           
            <div class="panel panel-default">
                <div class="panel-heading">                                        
                    <h4 align="center"> LISTA DE CITAS MEDICAS PARA EL DIA</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                    <th>Identificación</th>
                                    <th>hora</th>                                                                        
                                    <th>Atender</th>
                                    <th>Asistencia</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeCita facCita = new FacadeCita();
                                    MedicoDTO med = (MedicoDTO) session.getAttribute("medico");
                                    int id_medico = med.getIdentificacion_med();

                                    //Date hoy = new Date();
                                    //SimpleDateFormat fecha = new SimpleDateFormat("YYYY-MM-DD");
                                    //System.out.println(fecha + "");

                                    Date fecha = new Date();
                                    String sFecha = "";
                                    
                                    int iEntero = fecha.getYear() + 1900;
                                    
                                    sFecha = String.valueOf(iEntero);
                                    iEntero = fecha.getMonth();
                                    
                                    sFecha = sFecha + "-0" + String.valueOf(iEntero);
                                    iEntero = fecha.getDate();
                                    
                                    sFecha = sFecha + "-" + String.valueOf(iEntero);
                                    
                                    String fecha2 = sFecha;
                                    System.out.println(" fecha: "+fecha2);
                                    

                                    List<CitaDTO> doc = facCita.consultarCitasMedicoDia(id_medico, fecha2);

                                    for (int i = 0; i < doc.size(); i++) {

                                        String nombre = doc.get(i).getNombre_usuario();
                                        int identf = doc.get(i).getId_usuario();
                                        String hora = doc.get(i).getHora_cita();
                                        String servicio = doc.get(i).getServicio_cita();
                                        System.out.println("servicioo: " + servicio);
                                        int idcita = doc.get(i).getId_cita();
                                        String fechac = doc.get(i).getFecha_cita();
                                        String tipoUsuario = doc.get(i).getTipousuario_cita();
                                        int cantidad = i + 1;

                                %>

                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc"><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=hora%></td>                                                                        
                                    <%
                                        if (servicio.equals("medicinageneral")) {

                                    %>
                                    <td><input type="submit" class="btn btn-default" value="atender" onclick="cargarForm('medico/recargoMedico_HistoriaMedicina.jsp?id=<%=identf%>&idcita=<%=idcita%>&tipo=<%=tipoUsuario%>')"> </td>
                                        <%
                                        } else if (servicio.equals("psicologia")) {
                                        %>
                                    <td><input type="submit" class="btn btn-default" value="atender" onclick="cargarForm('medico/recargoMedico_HistoriaPsicologia.jsp?id=<%=identf%>&idcita=<%=idcita%>&tipo=<%=tipoUsuario%>')"> </td>
                                        <%
                                        } else if (servicio.equals("planificacionfamiliar")) {
                                        %>
                                    <td><input type="submit" class="btn btn-default" value="atender" onclick="cargarForm('medico/recargoMedico_historiaPlanificacion.jsp?id=<%=identf%>&idcita=<%=idcita%>&tipo=<%=tipoUsuario%>')"> </td>
                                        <%
                                            }
                                        %>

                                    <td>No asistio</td>
                                </tr> 
                                <%
                                    }
                                %>  
                            </tbody>                               
                        </table>
                    </div>                                                   
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
        <script src="../js/jquery-2.1.4.min.js"></script>
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</html>
