<%-- 
    Document   : recargoMedico_ConsultarCitasFecha2
    Created on : 28-mar-2017, 21:10:47
    Author     : Gladys M
--%>

<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.MedicoDTO"%>
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
                    <h4 align="center"> LISTA DE CITAS MEDICAS PARA LA FECHA SELECCIONADA</h4>
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
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeCita facCita = new FacadeCita();
                                    MedicoDTO med = (MedicoDTO) session.getAttribute("medico");
                                    int id = med.getIdentificacion();                                                                       
                                    
                                    String fecha = request.getParameter("fecha");

                                    List<CitaDTO> doc = facCita.consultarCitasMedicoDia(id, fecha);

                                    for (int i = 0; i < doc.size(); i++) {

                                        String nombre = doc.get(i).getNombre_usuario();
                                        int identf = doc.get(i).getId_usuario();
                                        String hora = doc.get(i).getHora_cita();

                                        int cantidad = i + 1;

                                %>

                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc"><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=hora%></td>                                                                                                            
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
