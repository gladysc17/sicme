<%-- 
    Document   : recargoAdmin_ListarEstudiantes1
    Created on : 22-mar-2017, 19:00:58
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
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10 col-sm-12">                           
            <div class="panel panel-default">
                <div class="panel-heading">                                        
                    <h4 align="center"> LISTA DE ESTUDIANTES REGISTRADOS EN EL SISTEMA</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                    <th>Identificación</th>
                                    <th>Codigo</th>
                                    <th>Programa</th>
                                    <th>Telefono</th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeEstudiante facEst = new FacadeEstudiante();

                                    List<EstudianteDTO> est = facEst.consultarEstudiantes();                                                                        
                                    
                                    for (int i = 0; i < est.size(); i++) {

                                        String nombre = est.get(i).getNombre();
                                        int identf = est.get(i).getIdentificacion();
                                        String carrera = est.get(i).getPrograma();
                                        int codigo = est.get(i).getCodigo();
                                        int cantidad = i+1;
                                        String tel = est.get(i).getTelefono();                                                

                                %>
                            
                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc"><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=codigo%></td>
                                    <td><%=carrera%></td>
                                    <td> <%=tel%></td> 
                                    <td><input type="submit" class="btn btn-default" value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarEstudiante.jsp?identf=<%=identf%>')"> </td>
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