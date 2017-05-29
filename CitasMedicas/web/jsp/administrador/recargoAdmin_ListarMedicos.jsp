<%-- 
    Document   : recargoAdmin_ListarMedicos
    Created on : 29/05/2017, 09:38:35 AM
    Author     : LEGADO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
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
                    <h4 align="center"> LISTA DE USUARIOS REGISTRADOS EN EL SISTEMA</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Nombre</th>
                                    <th>Codigo</th>
                                    <th>Identificacion</th>
                                    <th>Servicio</th>
                                    <th>Asignar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeMedico medicos = new FacadeMedico();

                                    ArrayList<String[]> lis = medicos.listadoMedico();
                                    
                                    for (int i = 0; i < lis.size(); i++) {
                                        String [] aux = lis.get(i);
                                        String nombre = aux[0];
                                        String codigo = aux[1];
                                        String identf = aux[2];
                                        String servicio = aux[3];
                                        int cantidad = i+1;

                                %>
                            
                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                                    <td><%=codigo%></td>
                                    <td><%=identf%></td>
                                    <td><%=servicio%></td>
                                    <td><input type="submit" class="btn btn-default" value="Asignar Horario" onclick="cargarForm('administrador/recargoAdmin_AsignarHorario.jsp?ident=<%=identf%>')"> </td>
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
