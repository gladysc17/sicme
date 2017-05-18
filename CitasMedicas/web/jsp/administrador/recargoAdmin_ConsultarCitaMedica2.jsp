<%-- 
    Document   : recargoAdmin_ConsultarCitaMedica2
    Created on : 27-mar-2017, 19:48:16
    Author     : Gladys M
--%>

<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="panel panel-default">

            <%
                String ide = request.getParameter("identf");

                FacadeCita cita = new FacadeCita();
                List<CitaDTO> lista = cita.consultarCitasUsuario(ide);
                
                if(!lista.isEmpty()){
                                    
            %>
                        
            <div class="panel panel-default">
                <div class="panel-heading">
                    <p> Lista de citas programadas</p>
                    
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                    <th>Servicio</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Estado</th> 
                                    <th>Modificar</th> 
                                </tr>
                            </thead>
                            <%                                    
                for (int i = 0; i < lista.size(); i++) {
                    String id = lista.get(i).getId_usuario();
                    String nombre = lista.get(i).getNombre_usuario();
                    String servicio = lista.get(i).getServicio_cita();
                    String fecha = lista.get(i).getFecha_cita();
                    String hora = lista.get(i).getHora_cita();
                    String estado = lista.get(i).getEstado();
                    int id_medico = lista.get(i).getId_medico();
                    int idcita = lista.get(i).getId_cita();
                    int numero = i+1;
              %>
                            <tbody>                                       
                                <tr  role="row" class="odd">                                    
                                    <td><%=numero%></td>
                                    <td class="sorting_asc"><%=nombre%></td>
                                    <td><%=servicio%></td>
                                    <td><%=fecha%></td>
                                    <td><%=hora%></td>
                                    <td><%=estado%></td>    
                                    <%
                                    if (estado.equals("pendiente")){
                                    %>
                                    <td><input type="submit" class="btn btn-default" value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarCita.jsp?id='+<%=idcita%>)"> </td>
                                    <%    
                                    }
                                    else{
                                        %>
                                    <td></td>
                                    <% 
                                    }
                                    
                                    %>
                                </tr>                                                            
                            </tbody>    
                            <%
                        }
                                
                    %>
                        </table>                                                        
                    </div> 
                        
                </div>   
                          <%
                } else{
                %>
                <h3> No cuenta con citas programadas</h3>
                        <%
                }
                        %>     
            </div> 
        </div> 
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
