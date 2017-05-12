<%-- 
    Document   : recargoVice_InformeEstudiantes
    Created on : 20-mar-2017, 10:45:17
    Author     : Gladys M
--%>

<%@page import="DTO.EstudianteDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
    </head>

    <body>
        <h1 align="center"> Lista de estudiantes registrados en el sistema </h1>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">                      
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Nombre</th>
                                    <th>Identificación</th>
                                    <th>Codigo</th>
                                    <th>Programa</th>
                                    <th>Informe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                     FacadeEstudiante facEst = new FacadeEstudiante();

                                    List<EstudianteDTO> est = facEst.consultarEstudiantes();

                                    for (int i = 0; i < est.size(); i++) {

                                        String nombre = est.get(i).getNombre_est();
                                        int id = est.get(i).getIdentificacion_est();
                                        String carrera = est.get(i).getPrograma_est();
                                        int codigo = est.get(i).getCodigo_est();
                                %>
                                <tr role="row" class="odd">
                                    <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                                    <td><%=id%></td>
                                    <td><%=codigo%></td>
                                    <td><%=carrera%></td>
                                    <td> Informe</td>
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


        <!-- Javascripts-->
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
